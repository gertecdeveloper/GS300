package com.example.easylayer_110_gs300.SegundoDisplay;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.widget.Button;
import android.widget.FrameLayout;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.example.easylayer_110_gs300.R;
import com.gertec.easylayer.lcd.LCD;
import com.gertec.easylayer.printer.auxiliary.Alignment;

import java.util.ArrayList;


public class Segundo_Display extends AppCompatActivity {

    LCD lcd = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_segundo_display);

        lcd = new LCD(this);

        //Configuração do Fragment
        Fragment fragment = new FragmentWidget();
        FrameLayout frameLayout = findViewById(R.id.widgetContainer);
        lcd.setWidgetConfig(fragment, frameLayout);

        //Botão de iniciar carousel de imagens
        //Imagem: 250px X 100px
        Button button_startC = findViewById(R.id.btn_startC);
        button_startC.setOnClickListener(v -> {

            ArrayList<Bitmap> bitmaps = new ArrayList<>();
            bitmaps.add(BitmapFactory.decodeResource(getResources(), R.drawable.image1));
            bitmaps.add(BitmapFactory.decodeResource(getResources(), R.drawable.image2));
            bitmaps.add(BitmapFactory.decodeResource(getResources(), R.drawable.image3));

            lcd.startCarousel(bitmaps, 2);
        });

        //Botão de parar carousel de imagens (para na tela que está sendo apresentada)
        Button button_stopC = findViewById(R.id.btn_stopC);
        button_stopC.setOnClickListener(v -> {

            lcd.stopCarousel();

        });

        //Botão de limpar display
        //Ao limpar o display, ele apresenta uma tela branca, implementei uma imagem para fins estéticos.
        Button button_clear = findViewById(R.id.button_clear);
        button_clear.setOnClickListener(v -> {
            //Parar as imagens
            lcd.stopCarousel();
            //Limapr o display
            lcd.clearScreen();
            //Implementação de imagem para fins estéticos
            ArrayList<Bitmap> bitmaps2 = new ArrayList<>();
            bitmaps2.add(BitmapFactory.decodeResource(getResources(), R.drawable.gerteclogo));
            lcd.startCarousel(bitmaps2, 2);
        });
    }

    @Override
    protected void onStart() {
        super.onStart();

        //Botão de espelhar Widget
        Button btnMirrorWidget = findViewById(R.id.btnMirrorWidget);
        btnMirrorWidget.setOnClickListener(v -> {

            lcd.showWidgetInLCD();
        });
    }

}
