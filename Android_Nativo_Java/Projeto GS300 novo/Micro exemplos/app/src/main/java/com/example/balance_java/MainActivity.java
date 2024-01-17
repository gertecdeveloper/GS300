package com.example.balance_java;

import android.graphics.Color;
import android.os.Bundle;
import android.serialport.SerialPort;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;



import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;



public class MainActivity extends AppCompatActivity {
    private SerialPort mSerialPort;
    TextView tvStatus, tvWeight;
    String lastWeight = "";
    private Thread thread;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tvStatus = findViewById(R.id.tv_status);
        tvWeight = findViewById(R.id.tv_weight);

        findViewById(R.id.btn_open).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onUartCallback();
            }
        });

        findViewById(R.id.btn_close).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                closeUartCallback();
            }
        });
    }

    private String parseWeight(String data) {
        if (data.length() >= 7) {
            String weight = data.substring(1, 7);
            weight = weight.replaceAll("[^0-9.]", "");
            if (!weight.isEmpty()) {
                return String.valueOf(Double.parseDouble(weight));
            } else {
                return "0";
            }
        } else {
            return "0";
        }
    }

    public void onUartCallback() {
        File file = new File("/dev/ttyS0");
        try {
            mSerialPort = new SerialPort(file, 4800, 8,0, 1, 0);
            byte[] data = new byte[]{0x01};
            OutputStream outputStream = mSerialPort.getOutputStream();
            outputStream.write(data);
            outputStream.flush();
            tvStatus.setText("Porta Conectada");
            tvStatus.setTextColor(Color.parseColor("#1A9C90"));

            thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    while (!Thread.currentThread().isInterrupted()) {
                        readDataFromSerialPort();
                        try {
                            Thread.sleep(1000); // Atraso de 1 segundo
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                            Thread.currentThread().interrupt();
                        }
                    }
                }
            });
            thread.start();

        } catch (SecurityException | IOException e) {
            e.printStackTrace();
            tvStatus.setText("Falha ao conectar à porta");
        }
    }

    public void readDataFromSerialPort() {
        if (mSerialPort != null) {
            InputStream inputStream = mSerialPort.getInputStream();
            try {
                byte[] buffer = new byte[64];
                int length = inputStream.read(buffer);
                if (length > 0) {
                    String data = new String(buffer, 0, length);
                    String weight = parseWeight(data);
                    if (!weight.equals(lastWeight)) {
                        lastWeight = weight;
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvWeight.setText("Peso: " + weight);
                            }
                        });
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
                tvStatus.setText("Falha ao ler dados da porta");
            }
        } else {
            tvStatus.setText("Falha ao ler dados da porta");
        }
    }

    public void closeUartCallback() {
        if (mSerialPort != null) {
            byte[] data = new byte[]{0x00};
            try {
                OutputStream outputStream = mSerialPort.getOutputStream();
                outputStream.write(data);
                outputStream.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            mSerialPort.close();
            tvStatus.setText("Porta Desconectada");
            tvStatus.setTextColor(Color.parseColor("#CC2020"));
            if (thread != null) {
                thread.interrupt();
            }
        } else {
            tvStatus.setText("Falha ao fechar a porta");

        }
    }
}
