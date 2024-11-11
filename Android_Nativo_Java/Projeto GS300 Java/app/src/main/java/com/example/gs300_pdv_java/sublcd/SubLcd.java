package com.example.gs300_pdv_java.sublcd;

import static com.android.sublcdlibrary.SubLcdConstant.CMD_PROTOCOL_BMP_DISPLAY;
import static com.android.sublcdlibrary.SubLcdConstant.CMD_PROTOCOL_START_SCAN;
import static com.android.sublcdlibrary.SubLcdConstant.CMD_PROTOCOL_UPDATE;

import android.Manifest;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.speech.tts.Voice;
import android.text.Layout;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.sublcdlibrary.SubLcdException;
import com.android.sublcdlibrary.SubLcdHelper;
import com.example.texttospeaks.TextToFala;
import com.example.gs300_pdv_java.R;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.Set;


public class SubLcd extends AppCompatActivity implements SubLcdHelper.VuleCalBack {

    Set<Locale> localeSet;
    Set<Voice> voice;
    Button btnStart, btnStop, btnLigarLed;
    TextView txtResultado;

    ListView listCursos;
    List<String> consulta;
    ArrayAdapter<String> adapter;
    private static final int PERMISSIONS_REQUEST = 1;
    private static final String PERMISSION_WRITE_STORAGE = Manifest.permission.WRITE_EXTERNAL_STORAGE;
    private static final String PERMISSION_READ_STORAGE = Manifest.permission.READ_EXTERNAL_STORAGE;
    private final String[] Permission = new String[]{PERMISSION_WRITE_STORAGE, PERMISSION_READ_STORAGE};
    private int cmdflag;
    private boolean isShowResult = false;
    private Toast toast;
    private final String TAG = "PrintService";
    String flagtxt = null;
    Handler handler = new Handler();
    Handler handler1 = new Handler();
    Handler handler2 = new Handler();
    Handler handler3 = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub_lcd);

        listCursos = findViewById(R.id.lvConsulta);
        consulta = new ArrayList<String>();
        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, consulta);
        listCursos.setAdapter(adapter);

        btnStart = findViewById(R.id.btnStar);
        btnStop = findViewById(R.id.btnStop);
        btnLigarLed = findViewById(R.id.btnLigarLed);
        txtResultado = findViewById(R.id.txtResultado);
        TextToFala.getInstance(this.getApplicationContext()).init(this.getApplicationContext());


        SubLcdHelper.getInstance().init(getApplicationContext());
        SubLcdHelper.getInstance().SetCalBack(this::datatrigger);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SubImages();
            }
        });

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String text = "GS300 Terminal PDV";
                try {
                    //TextToFala.getInstance(getApplicationContext()).speechText(text);
                } catch (Exception e) {
                    txtResultado.setText(e.toString());
                }

                try {
                    SubLcdHelper.getInstance().sendText(text, Layout.Alignment.ALIGN_NORMAL, 60);
                    cmdflag = CMD_PROTOCOL_BMP_DISPLAY;
                    mHandler.sendEmptyMessageDelayed(MSG_REFRESH_NO_SHOWRESULT, 300);
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
            }
        });

        btnLigarLed.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                AsyncTask.execute(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            SubLcdHelper.getInstance().sendScan();
                            cmdflag = CMD_PROTOCOL_START_SCAN;
                            mHandler.sendEmptyMessageDelayed(MSG_REFRESH_SHOWRESULT, 300);
                        } catch (SubLcdException e) {
                            SubLcdHelper.getInstance().release();
                            e.printStackTrace();
                        }
                    }
                });
            }
        });


    }


    @Override
    public void datatrigger(String s, int cmd) {
        runOnUiThread(() -> {
            if (!TextUtils.isEmpty(s)) {
                if (cmd == cmdflag) {
                    if (cmd == CMD_PROTOCOL_UPDATE && s.equals(" data is incorrect")) {
                        closeLoading();
                        mHandler.removeMessages(MSG_REFRESH_SHOWRESULT);
                        mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT);
                        Log.i(TAG, "datatrigger result=" + s);
                        Log.i(TAG, "datatrigger cmd=" + cmd);
                        if (isShowResult) {
                            //showtoast(getString(R.string.updatesuccessed));
                        }
                    } else if (cmd == CMD_PROTOCOL_UPDATE && (s.equals("updatalogo") || s.equals("updatafilenameok") || s.equals("updatauImage") || s.equals("updataok"))) {
                        Log.i(TAG, "neglect");
                    } else if (cmd == CMD_PROTOCOL_UPDATE && (s.equals("Same_version"))) {
                        closeLoading();
                        mHandler.removeMessages(MSG_REFRESH_SHOWRESULT);
                        mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT);
                        Log.i(TAG, "datatrigger result=" + s);
                        Log.i(TAG, "datatrigger cmd=" + cmd);
                        if (isShowResult) {
                            //showtoast(getString(R.string.same_version));
                        }
                    } else {
                        mHandler.removeMessages(MSG_REFRESH_SHOWRESULT);
                        mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT);
                        Log.i(TAG, "datatrigger result=" + s);
                        Log.i(TAG, "datatrigger cmd=" + cmd);
                        if (isShowResult) {
                            showtoast(s);

                        }
                    }
                }
            }
        });
    }

    private boolean hasPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return checkSelfPermission(PERMISSION_READ_STORAGE) == PackageManager.PERMISSION_GRANTED &&
                    checkSelfPermission(PERMISSION_WRITE_STORAGE) == PackageManager.PERMISSION_GRANTED;
        } else {
            return true;
        }
    }

    private void requestPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermissions(Permission, PERMISSIONS_REQUEST);
        }
    }

    private static final int MSG_REFRESH_SHOWRESULT = 0x11;
    private static final int MSG_REFRESH_NO_SHOWRESULT = 0x12;
    private static final int MSG_REFRESH_UPGRADING_SYSTEM = 0x13;
    private Handler mHandler = new Handler(new Handler.Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            switch (msg.what) {
                case MSG_REFRESH_SHOWRESULT:
                    isShowResult = true;
                    SubLcdHelper.getInstance().readData();
                    mHandler.removeMessages(MSG_REFRESH_SHOWRESULT);
                    mHandler.sendEmptyMessageDelayed(MSG_REFRESH_SHOWRESULT, 100);
                    break;
                case MSG_REFRESH_NO_SHOWRESULT:
                    isShowResult = false;
                    SubLcdHelper.getInstance().readData();
                    mHandler.removeMessages(MSG_REFRESH_NO_SHOWRESULT);
                    mHandler.sendEmptyMessageDelayed(MSG_REFRESH_NO_SHOWRESULT, 100);
                    break;
                case MSG_REFRESH_UPGRADING_SYSTEM:
                    showLoading();
                    mHandler.sendEmptyMessage(MSG_REFRESH_SHOWRESULT);
                    break;
            }
            return false;
        }
    });

    private void closeLoading() {
        runOnUiThread(() -> {
            //LoadingDialogUtil.getInstance().closeLoadingDialog();//Enable loading animation
        });
    }

    private void showLoading() {
        runOnUiThread(() -> {
            //LoadingDialogUtil.getInstance().showLoadingDialog(MainActivity.this, "The secondary screen is being upgraded, please do not operate...");//Enable loading animation
        });
    }

    private void showtoast(String s) {
        runOnUiThread(() -> {
            if (toast != null) {
                toast.cancel();
                toast = Toast.makeText(this, s, Toast.LENGTH_SHORT);
                if (Objects.equals(s, "scandatatimeout")) {
                    txtResultado.setText("Falha na leitura");
                    TextToFala.getInstance(getApplicationContext()).speechText("Falha na leitura");
                    toast = Toast.makeText(this, "Falha na leitura", Toast.LENGTH_SHORT);
                } else {
                    consulta.add(s);
                    Collections.reverse(consulta);
                    adapter.notifyDataSetChanged();
                    TextToFala.getInstance(getApplicationContext()).speechText("Sucesso na leitura");
                }

                try {
                    Bitmap bp = BitmapFactory.decodeResource(getResources(), R.drawable.gertec4);
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bp, 90));
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
                toast.show();


            } else {
                toast = Toast.makeText(this, s, Toast.LENGTH_SHORT);
                if (Objects.equals(s, "scandatatimeout")) {
                    txtResultado.setText("Falha na leitura");
                    TextToFala.getInstance(getApplicationContext()).speechText("Falha na leitura");
                    toast = Toast.makeText(this, "Falha na leitura", Toast.LENGTH_SHORT);
                } else {
                    consulta.add(s);
                    Collections.reverse(consulta);
                    adapter.notifyDataSetChanged();
                    TextToFala.getInstance(getApplicationContext()).speechText("Sucesso na leitura");
                }
                try {
                    Bitmap bp = BitmapFactory.decodeResource(getResources(), R.drawable.gertec4);
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bp, 90));
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
                toast.show();
                flagtxt = "1";

            }
        });
    }

    //Função para envio de uma sequência de imagens para o segundo display
    public void SubImages() {
        Bitmap bp = BitmapFactory.decodeResource(getResources(), R.drawable.gertec4);
        Bitmap bpp = BitmapFactory.decodeResource(getResources(), R.drawable.valor4);
        Bitmap bpb = BitmapFactory.decodeResource(getResources(), R.drawable.pix8);
        Bitmap bpbp = BitmapFactory.decodeResource(getResources(), R.drawable.gertec3);
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bpb, 90));
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
            }
        }, 2000);
        handler1.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bpp, 90));
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
            }
        }, 4000);
        handler2.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bpbp, 90));
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
            }
        }, 6000);
        handler3.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(bp, 90));
                } catch (SubLcdException e) {
                    e.printStackTrace();
                }
            }
        }, 9000);
    }

}