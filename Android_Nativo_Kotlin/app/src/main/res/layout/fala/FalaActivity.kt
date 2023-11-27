package com.example.gs300_kotlin.fala

import android.os.Bundle
import com.example.gs300_kotlin.R
import android.speech.tts.Voice
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import br.com.estudos.texttospeaks.TextToFala
import java.util.*

class FalaActivity : AppCompatActivity() {

    lateinit var btnFrase1: Button
    lateinit var btnFrase2: Button
    lateinit var btnFrase3: Button
    lateinit var btnFrase4: Button
    lateinit var txtFrase: EditText

    var localeSet: Set<Locale>? = null
    var voice: Set<Voice>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_fala)

        TextToFala.getInstance(this.applicationContext).init(this.applicationContext)

        btnFrase1 = findViewById(R.id.btnFrase1)
        btnFrase2 = findViewById(R.id.btnFrase2)
        btnFrase3 = findViewById(R.id.btnFrase3)
        btnFrase4 = findViewById(R.id.btnFrase4)

        txtFrase = findViewById(R.id.txtFrase)
        txtFrase.setText("Um produto que traz flexibilidade no uso, \norientado a inovação, com uso ilimitado \nem suas ideias e projetos. O Céu é o limite.")

        btnFrase1.setOnClickListener {
            TextToFala.getInstance(applicationContext).speechText("Sejam todos bem vindos a apresentação do GS300")
        }

        btnFrase2.setOnClickListener {
            TextToFala.getInstance(applicationContext).speechText("O GS300 já vem com display cliente e impressora integrada")
        }

        btnFrase3.setOnClickListener {
            TextToFala.getInstance(applicationContext).speechText("Gertec a evolução da experiencia do cliente.")
        }

        btnFrase4.setOnClickListener {
            if (txtFrase.text.toString().isEmpty()) {
                Toast.makeText(applicationContext, "Digite uma Frase.", Toast.LENGTH_LONG).show()
            } else {
                TextToFala.getInstance(applicationContext).speechText(txtFrase.text.toString())
            }
        }
    }
}
