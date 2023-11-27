package com.example.gs300_2023

import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.AlertDialog
import com.example.gs300_2023.fala.FalaActivity
import com.example.gs300_2023.impressora.ImpressoraActivity
import com.example.gs300_2023.msitef.Tef
import com.example.gs300_2023.nfc.NfcExemplo
import com.example.gs300_2023.sat.MenuSat
import com.example.gs300_2023.sublcd.SubLcd


class MainActivity : AppCompatActivity() {
    private lateinit var WangPosManagerClass: Class<*>
    private lateinit var WangPosManager: Any
    private val Model = Build.MODEL

    companion object {
        fun getVersion(): String? {
            val PLATAFORMA = "Android Studio"
            val VERSION = "1.0.0"
            return "$PLATAFORMA - $VERSION - GS300"
        }
        const val ACTIVITY_SEGUNDO_DISPLAY = "Segundo Display"
        const val ACTIVITY_NFC = "NFC - NDF"
        const val ACTIVITY_FALA = "Texto para Fala"
        const val ACTIVITY_SAT = "Sat"
        const val ACTIVITY_TEF = "Tef"
        const val ACTIVITY_IMPRESSORA = "Impressão"
        const val ACTIVITY_TEF_FEIRA = "Tef"
    }

    private var projetos = ArrayList<Projeto>()
    private lateinit var lvProjetos: ListView

    private lateinit var txtProject: TextView
    private lateinit var alerta: AlertDialog
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        lvProjetos = findViewById(R.id.lvProjetos)
        txtProject = findViewById(R.id.txtNameProject)
        txtProject.text = getVersion()
        projetos.add(Projeto(ACTIVITY_IMPRESSORA, R.drawable.print))
        projetos.add(Projeto(ACTIVITY_SEGUNDO_DISPLAY, R.drawable.customerdisplay))
        projetos.add(Projeto(ACTIVITY_NFC, R.drawable.nfc2))
        projetos.add(Projeto(ACTIVITY_FALA, R.drawable.speaker))
        projetos.add(Projeto(ACTIVITY_TEF, R.drawable.tef))
        projetos.add(Projeto(ACTIVITY_SAT, R.drawable.icon_sat))
        //projetos.add(Projeto(ACTIVITY_TEF_FEIRA, R.drawable.icon_sat))
        val adapter = ProjetoAdapter(baseContext, R.layout.listprojetos, projetos)
        lvProjetos.adapter = adapter
        lvProjetos.setOnItemClickListener { adapterView, view, i, l ->
            val projeto = lvProjetos.getItemAtPosition(i) as Projeto

            var intent: Intent? = null
            when (projeto.nome) {
                //G-BOT Implementação Futura
                ACTIVITY_SEGUNDO_DISPLAY -> {
                    intent = Intent(this@MainActivity, SubLcd::class.java)
                }
                ACTIVITY_NFC -> {
                    intent = Intent(this@MainActivity, NfcExemplo::class.java)
                }

                //A112
                /*ACTIVITY_IMPRESSAO -> {
                    intent = Intent(this@MainActivity, Impressora::class.java)
                }*/
                /*ACTIVITY_DISPLAY -> {
                    intent = Intent(this@MainActivity, DisplayActivity::class.java)
                }*/

                //Activities Comuns
                ACTIVITY_TEF -> {
                     intent = Intent(this@MainActivity, Tef::class.java)
                }

                ACTIVITY_SAT -> {
                     intent = Intent(this@MainActivity, MenuSat::class.java)
                }

                ACTIVITY_FALA -> {
                    intent = Intent(this@MainActivity, FalaActivity::class.java)
                }

                ACTIVITY_IMPRESSORA -> {
                    intent = Intent(this@MainActivity, ImpressoraActivity::class.java)
                }

//                ACTIVITY_TEF_FEIRA -> {
//                    intent = Intent(this@MainActivity, SensorActivity::class.java)
//                }
            }

            if (intent != null) {
                startActivity(intent)
            }
        }

    }

}