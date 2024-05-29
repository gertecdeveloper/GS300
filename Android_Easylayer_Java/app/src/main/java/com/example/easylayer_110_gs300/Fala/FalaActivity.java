package com.example.easylayer_110_gs300.Fala;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.speech.tts.Voice;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.easylayer_110_gs300.R;
import com.example.texttospeaks.TextToFala;

import java.util.Locale;
import java.util.Set;

public class FalaActivity extends AppCompatActivity {

    Button btnFrase1, btnFrase2, btnFrase3, btnFrase4;
    EditText txtFrase;

    Set<Locale> localeSet;
    Set<Voice> voice;

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fala);

        //Instanciando a classe TextToFala
        TextToFala.getInstance(this.getApplicationContext()).init(this.getApplicationContext());

        //Declarando botões e text
        btnFrase1 = findViewById(R.id.btnFrase1);
        btnFrase2 = findViewById(R.id.btnFrase2);
        btnFrase3 = findViewById(R.id.btnFrase3);
        btnFrase4 = findViewById(R.id.btnFrase4);
        txtFrase = findViewById(R.id.txtFrase);

        //Texto já escrito
        txtFrase.setText("Um produto que traz flexibilidade no uso, " +
                "\norientado a inovação, com uso ilimitado \nem suas ideias e projetos.");

        //Botão com a primeira frase
        btnFrase1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextToFala.getInstance(getApplicationContext()).speechText("Sejam todos bem vindos a apresentação do GS300");
            }
        });

        //Botão com a segunda frase
        btnFrase2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextToFala.getInstance(getApplicationContext()).speechText("O GS300 já vem com display cliente e impressora integrada");
            }
        });

        //Botão com a terceira frase
        btnFrase3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TextToFala.getInstance(getApplicationContext()).speechText("Gertec a evolução da experiencia do cliente.");
            }
        });

        //Botão para a fraze digitada
        btnFrase4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(txtFrase.getText().toString().isEmpty()){
                    Toast.makeText(getApplicationContext(), "Digite uma frase.", Toast.LENGTH_LONG).show();
                }else{
                    TextToFala.getInstance(getApplicationContext()).speechText(txtFrase.getText().toString());
                }
            }
        });
    }
}