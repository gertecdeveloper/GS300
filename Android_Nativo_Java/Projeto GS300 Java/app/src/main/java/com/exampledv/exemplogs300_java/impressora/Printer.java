package com.exampledv.exemplogs300_java.impressora;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;

import com.elotouch.AP80.sdkhelper.AP80PrintHelper;
import com.exampledv.exemplogs300_java.R;

public class Printer extends AppCompatActivity {

    Button btnImage, btnCupom, btnPrintQRCode, btnPrintCodaBar;
    private AP80PrintHelper printHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_printer);

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

        printHelper = AP80PrintHelper.getInstance();
        printHelper.initPrint(this);

        btnImage = findViewById(R.id.btImage);
        btnCupom = findViewById(R.id.btCupom);
        btnPrintCodaBar = findViewById(R.id.btImprimirCodeBar);
        btnPrintQRCode = findViewById(R.id.btImprimirQRCode);
        Bitmap plogo1 = BitmapFactory.decodeResource(getResources(), R.drawable.img);
        Bitmap plogo2 = BitmapFactory.decodeResource(getResources(), R.drawable.img);

        btnImage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                printHelper.printBitmap(plogo1, 1, 80);
                printSpace(7);
                printHelper.printStart();
                printHelper.cutPaper(1);
            }
        });

        btnCupom.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                printHelper.printBitmap(plogo2, 1, 80);
                printSpace(1);
                printCupom();
                printSpace(1);
                printHelper.printQRCode("https://www.gertec.com.br", 2, 1);
                printSpace(1);
                printHelper.printBarCode("7899970400070", 2, 100, 200, 1, 0);
                printHelper.printData("7899970400070", 25, 0, false, 1, 80, 0);
                printSpace(7);
                printHelper.printStart();
                printHelper.cutPaper(1);
            }
        });
        btnPrintQRCode.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                printHelper.printQRCode("https://www.gertec.com.br", 2, 1);
                printHelper.printData("https://www.gertec.com.br", 25, 0, false, 1, 80, 0);
                printSpace(7);
                printHelper.printStart();
                printHelper.cutPaper(1);
            }
        });
        btnPrintCodaBar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                printHelper.printBarCode("7899970400070", 2, 100, 200, 1, 0);
                printHelper.printData("7899970400070", 25, 0, false, 1, 80, 0);
                printSpace(7);
                printHelper.printStart();
                printHelper.cutPaper(1);
            }
        });
    }

    private void printCupom() {
        printHelper.printData("Gertec do Brasil", 32, 0, false, 1, 80, 0);
        printHelper.printData("Av. Jabaguara, 3060 - Mirandopolis", 30, 0, false, 1, 80, 0);
        printHelper.printData("São Paulo - Sp - CEP: 04046-500", 30, 0, false, 1, 80, 0);
        printHelper.printData("CNPJ: 03.654.119/0001-76", 30, 0, false, 1, 80, 0);
        printHelper.printData("IE: 286.502.952.112", 30, 0, false, 1, 80, 0);
        printHelper.printData("______________________________________", 30, 0, false, 1, 80, 1);
        printHelper.printData("Cupom Fiscal Eletronico", 32, 0, false, 1, 80, 0);
        printHelper.printData("Produto          Quant. V. Un. Valor", 30, 0, false, 0, 80, 0);
        printHelper.printData("Pêssego Branco     2     6.00   12.00", 30, 0, false, 0, 80, 0);
        printHelper.printData("Iogurte de morango 4    12.00   48.00", 30, 0, false, 0, 80, 0);
        printHelper.printData("Iogurte de frutas  10   10.00  100.00", 30, 0, false, 0, 80, 0);
        printHelper.printData("Bolo de frutas     10    4.00   40.00", 30, 0, false, 0, 80, 0);
        printHelper.printData("Morangos frescos   100  16.00 1600.00", 30, 0, false, 0, 80, 0);
        printHelper.printData("______________________________________", 30, 0, false, 1, 80, 1);
        printHelper.printData("Total: R$1800.00", 32, 0, false, 2, 80, 0);
        printHelper.printData("______________________________________", 30, 0, false, 1, 80, 1);
        printHelper.printData("N: 0000000139", 30, 0, false, 0, 80, 0);
        printHelper.printData("Serie: 65     20/08/2021", 30, 0, false, 0, 80, 0);
        printHelper.printData("______________________________________", 30, 0, false, 1, 80, 1);
        printHelper.printData("Consulte pela chave de acesso no site", 30, 0, false, 1, 80, 0);
        printHelper.printData("http://www.nfe.fazenda.sp.gov.br", 30, 0, false, 1, 80, 0);
        printHelper.printData("Chave de acesso:", 30, 0, false, 1, 80, 0);
        printHelper.printData("00000111112222233333444455556666777788889999", 25, 0, false, 1, 56, 0);
        printHelper.printData("______________________________________", 30, 0, false, 1, 80, 1);
        printHelper.printData("Consultor não identificado", 30, 0, false, 1, 80, 0);
        printHelper.printData("CPF: 000.000.000-00", 30, 0, false, 1, 80, 0);
    }

    //Função para avanço de papel em linhas
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