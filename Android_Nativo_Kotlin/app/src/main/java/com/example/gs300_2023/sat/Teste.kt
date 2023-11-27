package com.example.gs300_2023.sat

import android.annotation.SuppressLint
import android.app.Activity
import android.os.Bundle
import android.text.InputType
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import br.estudos.satfuncoes.SatFunctions
import com.example.gs300_2023.GlobalValues
import com.example.gs300_2023.R
import java.util.*

class Teste : Activity() {
    private lateinit var txtRetorno: TextView
    private lateinit var button_consultar: Button
    private lateinit var button_status: Button
    private lateinit var button_teste: Button
    private lateinit var button_vendas: Button
    private lateinit var button_cancelamento: Button
    private lateinit var button_sessao: Button
    private lateinit var txtCodAtivacao: EditText
    private lateinit var alerta: AlertDialog
    private val gerador = Random()
    private lateinit var satFunctions: SatFunctions
    var inputText: String? = null

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        satFunctions = SatFunctions(this)
        setContentView(R.layout.teste)
        button_consultar = findViewById(R.id.buttonConsultar)
        button_status = findViewById(R.id.buttonStatus)
        button_teste = findViewById(R.id.buttonFimaFim)
        button_vendas = findViewById(R.id.buttonTesteVenda)
        button_cancelamento = findViewById(R.id.buttonCancelamento)
        button_sessao = findViewById(R.id.buttonConsultarSessao)
        txtCodAtivacao = findViewById(R.id.txtCodAtivacao)

        txtRetorno = findViewById(R.id.txtRetorno)
        fun repostaSat(operacao: String) {
            var retornoOperaca = ""
            when (operacao) {
                "ConsultarSat" -> {
                    retornoOperaca = satFunctions.consultarSat(gerador.nextInt(999999))
                }
                "ConsultarStatusOperacional" -> {
                    retornoOperaca = satFunctions.consultarStatusOperacional(gerador.nextInt(999999), txtCodAtivacao.text.toString())
                }
                "EnviarTesteFim" -> {
                    retornoOperaca = satFunctions.enviarTesteFim(txtCodAtivacao.text.toString(), gerador.nextInt(999999))
                }
                "EnviarTesteVendas" -> {
                    Thread(Runnable {
                        var ret = ""
                        var count = 0
                        while (count < 1000) {
                            Log.d("Geovani", String.format("Testes: %d", count))
                            ret = satFunctions.enviarTesteVendas(txtCodAtivacao.text.toString(), gerador.nextInt(999999))
                            val finalRet = ret
                            runOnUiThread { txtRetorno.text = txtRetorno.text.toString() + '\n' + finalRet }
                            count++
                        }
                    }).start()
                }
                "CancelarUltimaVenda" -> {
                    retornoOperaca = satFunctions.cancelarUltimaVenda(txtCodAtivacao.text.toString(), inputText!!, gerador.nextInt(999999))
                }
                "ConsultarNumeroSessao" -> {
                    retornoOperaca = satFunctions.consultarNumeroSessao(txtCodAtivacao.text.toString(), Integer.valueOf(inputText!!.trim()), gerador.nextInt(999999))
                }
                else -> {
                    retornoOperaca = ""
                }
            }
        }
        txtCodAtivacao.setText(GlobalValues.codAtivacao)
        button_consultar.setOnClickListener {
            repostaSat("ConsultarSat")
        }

        button_status.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("ConsultarStatusOperacional")
            } else {
                Toast.makeText(this@Teste, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }

        button_teste.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("EnviarTesteFim")
            } else {
                Toast.makeText(this@Teste, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }

        button_vendas.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("EnviarTesteVendas")
            } else {
                Toast.makeText(this@Teste, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }
        button_cancelamento.setOnClickListener {
            val builder = AlertDialog.Builder(this@Teste)
            builder.setTitle("Atenção")
            builder.setMessage("Digite a chave de cancelamento")
            val input = EditText(this@Teste)
            input.setText(GlobalValues.ultimaChaveVenda)
            builder.setView(input)
            builder.setNeutralButton("OK") { dialog, which ->
                if (input.text.toString().length > 0) {
                    inputText = input.text.toString()
                    repostaSat("CancelarUltimaVenda")
                } else {
                    Toast.makeText(this@Teste, "Digite uma chave de cancelamento!", Toast.LENGTH_LONG).show()
                }
            }
            alerta = builder.create()
            alerta.show()
        }

        button_sessao.setOnClickListener {
            val builder = AlertDialog.Builder(this@Teste)
            builder.setTitle("Atenção")
            builder.setMessage("Digite o número da sessão")
            val input = EditText(this@Teste)
            input.inputType = InputType.TYPE_CLASS_NUMBER
            builder.setView(input)
            builder.setNeutralButton("OK") { dialog, which ->
                if (input.text.toString().length > 0) {
                    inputText = input.text.toString()
                    repostaSat("ConsultarNumeroSessao")
                } else {
                    Toast.makeText(this@Teste, "Digite um número de sessão!", Toast.LENGTH_LONG).show()
                }
            }
            alerta = builder.create()
            alerta.show()
        }


    }
}
