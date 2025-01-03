package com.exampledv.exemplogs300_java;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;

import com.exampledv.exemplogs300_java.balanca.Balanca;
import com.exampledv.exemplogs300_java.display2.SegundoDisplayActivity;
import com.exampledv.exemplogs300_java.fala.FalaActivity;
import com.exampledv.exemplogs300_java.gaveta.Gaveta;
import com.exampledv.exemplogs300_java.impressora.Printer;
import com.exampledv.exemplogs300_java.nfc.MifareActivity;
import com.exampledv.exemplogs300_java.sat.Sat;
import com.exampledv.exemplogs300_java.tef.Tef;

public class MainActivity extends AppCompatActivity {

    private Button infor, btn2Display, btnNfc, btnPrinter, btnSpeaker, btnSat, btnTef, btnBalanca, btnGaveta;
    Intent intent;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        // Ativa o modo full screen
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            getWindow().setDecorFitsSystemWindows(false);
        }

        View decorView = getWindow().getDecorView();
        WindowInsetsControllerCompat controller = ViewCompat.getWindowInsetsController(decorView);

        if (controller != null) {
            // Oculta as barras de sistema
            controller.hide(WindowInsetsCompat.Type.systemBars());
            // Permite que as barras apareçam com swipe
            controller.setSystemBarsBehavior(WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
        }

        infor = findViewById(R.id.infor);
        btn2Display = findViewById(R.id.btn2Display);
        btnNfc = findViewById(R.id.btnNfc);
        btnPrinter = findViewById(R.id.btnPrinter);
        btnSpeaker = findViewById(R.id.btnSpeaker);
        btnSat = findViewById(R.id.btnSat);
        btnTef = findViewById(R.id.btnTef);
        btnBalanca = findViewById(R.id.btnBalanca);
        btnGaveta = findViewById(R.id.btnGaveta);


        // Ação para abrir o diálogo ao clicar no botão "Infor"
        infor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Constrói o AlertDialog
                AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this)
                        .setTitle("Informações")
                        .setMessage("Equipamento: GS300\nSDK: ap80library-release.aar\nLinguagem: Java\nVersão do app: 1.0.0")
                        .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss(); // Fecha o diálogo ao clicar em OK
                            }
                        }).create();

                // Exibe o AlertDialog
                alertDialog.show();
            }
        });

        btn2Display.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, SegundoDisplayActivity.class);
                startActivity(intent);
            }
        });

        btnNfc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, MifareActivity.class);
                startActivity(intent);
            }
        });

        btnPrinter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Printer.class);
                startActivity(intent);
            }
        });

        btnSpeaker.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, FalaActivity.class);
                startActivity(intent);
            }
        });

        btnSat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Sat.class);
                startActivity(intent);
            }
        });

        btnTef.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Tef.class);
                startActivity(intent);
            }
        });

        btnBalanca.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Balanca.class);
                startActivity(intent);
            }
        });

        btnGaveta.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                intent = new Intent(MainActivity.this, Gaveta.class);
                startActivity(intent);
            }
        });

    }
}