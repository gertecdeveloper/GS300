package com.exampledv.exemplogs300_java.gaveta;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;

import com.elotouch.AP80.sdkhelper.AP80PrintHelper;
import com.exampledv.exemplogs300_java.R;

public class Gaveta extends AppCompatActivity {

    private AP80PrintHelper printHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gaveta);

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

// Inicializando a impressora
        printHelper = AP80PrintHelper.getInstance();
        printHelper.initPrint(this);

        // Inicializando o botão para abrir a gaveta
        Button btnOpenDrawer = findViewById(R.id.btnOpenDrawer);
        Bitmap plogo2 = BitmapFactory.decodeResource(getResources(), R.drawable.log_gertec_2);

        btnOpenDrawer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                // Imprime o logotipo e o restante do conteúdo
                printHelper.printBitmap(plogo2, 1, 80);
                printSpace(1);
                printHelper.printQRCode("https://www.gertec.com.br", 2, 1);
                printSpace(1);
                printHelper.printBarCode("7899970400070", 2, 100, 200, 1, 0);
                printHelper.printData("7899970400070", 25, 0, false, 1, 80, 0);
                printSpace(7);

                // Inicia a impressão e corta o papel
                printHelper.printStart();
                printHelper.cutPaper(1);

                // Aciona a gaveta após a impressão completa
                openDrawer();
            }
        });
    }

    // Método para abrir a gaveta

    public int openDrawer() {
        printHelper.openCashBox(); // Substituindo sendRawData pelo método openCashBox
        return 1;
    }

    // Função para avanço de papel em linhas
    private void printSpace(int n) {
        if (n < 0) {
            return;
        }
        StringBuilder str_space = new StringBuilder();
        for (int i = 0; i < n; i++) {
            str_space.append("\n");
        }
        printHelper.printData(str_space.toString(), 32, 0, false, 1, 80, 0);
    }
}