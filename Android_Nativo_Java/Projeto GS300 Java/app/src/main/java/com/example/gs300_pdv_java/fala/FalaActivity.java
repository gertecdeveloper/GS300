package com.example.gs300_pdv_java.fala;

import android.os.Bundle;
import android.speech.tts.Voice;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;


import com.example.texttospeaks.TextToFala;
import com.example.gs300_pdv_java.R;

import java.util.Locale;
import java.util.Set;


public class FalaActivity extends AppCompatActivity {

    Button btnFrase1, btnFrase2, btnFrase3, btnFrase4;
    EditText txtFrase;

    Set<Locale> localeSet;
    Set<Voice> voice;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fala);

        TextToFala.getInstance(this.getApplicationContext()).init(this.getApplicationContext());

        btnFrase1 = findViewById(R.id.btnFrase1);
        btnFrase2 = findViewById(R.id.btnFrase2);
        btnFrase3 = findViewById(R.id.btnFrase3);
        btnFrase4 = findViewById(R.id.btnFrase4);

        txtFrase = findViewById(R.id.txtFrase);
        txtFrase.setText("Um produto que traz flexibilidade no uso, \norientado a inovação, com uso ilimitado \nem suas ideias e projetos. O Céu é o limite.");

        btnFrase1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextToFala.getInstance(getApplicationContext()).speechText("Sejam todos bem vindos a apresentação do GS300");
            }
        });

        btnFrase2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextToFala.getInstance(getApplicationContext()).speechText("O GS300 já vem com display cliente e impressora integrada");
            }
        });

        btnFrase3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextToFala.getInstance(getApplicationContext()).speechText("Gertec a evolução da experiencia do cliente.");
            }
        });

        btnFrase4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(txtFrase.getText().toString().isEmpty()){
                    Toast.makeText(getApplicationContext(), "Digite uma Frase.", Toast.LENGTH_LONG).show();
                }else{
                    TextToFala.getInstance(getApplicationContext()).speechText(txtFrase.getText().toString());
                }
            }
        });
    }
}