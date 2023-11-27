package com.example.gs300_2023.sat

import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import br.estudos.satfuncoes.SatFunctions
import com.example.gs300_2023.R
import java.util.Random



class Rede : Activity() {
    private lateinit var button_configurar: Button
    private lateinit var txtCodAtivacao: EditText
    private lateinit var txtIp: EditText
    private lateinit var txtMascara: EditText
    private lateinit var txtGateway: EditText
    private lateinit var txtDns: EditText
    private lateinit var txtDns2: EditText
    private lateinit var txtProxyIp: EditText
    private lateinit var txtPorta: EditText
    private lateinit var txtUser: EditText
    private lateinit var txtPassword: EditText
    private lateinit var spinnerTipoRede: Spinner
    private lateinit var spinnerOptDns: Spinner
    private lateinit var spinnerOptProxy: Spinner
    private lateinit var alerta: android.app.AlertDialog

    companion object {
        val tipoRede = arrayOf("Estático", "DHCP")
        val optDns = arrayOf("Não", "Sim")
        val optProxy = arrayOf("Não usa proxy", "Proxy com configuração", "Proxy transparente")
        const val appPackage = "com.gertec.exemplosgertec8"
        val caminhoXML = "data/data/$appPackage/configRede.xml"
        val gerador = Random()
    }

    private lateinit var context: Context
    private lateinit var satFunctions: SatFunctions

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.rede)
        context = this@Rede
        satFunctions = SatFunctions(this)

    }
}
