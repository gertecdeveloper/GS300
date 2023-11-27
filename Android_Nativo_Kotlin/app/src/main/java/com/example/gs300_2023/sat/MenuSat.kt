package com.example.gs300_2023.sat

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.gs300_2023.R

class MenuSat : AppCompatActivity() {

    private lateinit var button_ativar: Button
    private lateinit var button_associar: Button
    private lateinit var button_teste: Button
    private lateinit var button_rede: Button
    private lateinit var button_alterar: Button
    private lateinit var button_outros: Button

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.menu_sat)
        button_ativar = findViewById(R.id.buttonAtivar2)
        button_associar = findViewById(R.id.buttonAssociar2)
        button_teste = findViewById(R.id.buttonTeste)
        button_rede = findViewById(R.id.buttonRede)
        button_alterar = findViewById(R.id.buttonAlterar2)
        button_outros = findViewById(R.id.buttonOutros)

        button_ativar.setOnClickListener {
            val it = Intent(this@MenuSat, Ativacao::class.java)
            startActivity(it)
        }

        button_associar.setOnClickListener {
            val it = Intent(this@MenuSat, Associar::class.java)
            startActivity(it)
        }

        button_alterar.setOnClickListener {
            val it = Intent(this@MenuSat, Alterar::class.java)
            startActivity(it)
        }

        button_outros.setOnClickListener {
            val it = Intent(this@MenuSat, Ferramentas::class.java)
            startActivity(it)
        }

        button_rede.setOnClickListener {
            val it = Intent(this@MenuSat, Rede::class.java)
            startActivity(it)
        }

        button_teste.setOnClickListener {
            val it = Intent(this@MenuSat, Teste::class.java)
            startActivity(it)
        }
    }
}
