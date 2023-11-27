package com.example.gs300_2023.sat

import android.annotation.SuppressLint
import android.app.Activity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import br.estudos.satfuncoes.OperacaoSat
import br.estudos.satfuncoes.SatFunctions
import com.example.gs300_2023.Components.ComponentsGertec
import com.example.gs300_2023.GlobalValues
import com.example.gs300_2023.R
import java.util.*

class Ferramentas : Activity() {

    private lateinit var button_bloquear: Button
    private lateinit var button_desbloquear: Button
    private lateinit var button_log: Button
    private lateinit var button_atualizar: Button
    private lateinit var button_versao: Button
    private lateinit var txtCodAtivacao: EditText
    private lateinit var alerta: AlertDialog
    private val gerador = Random()
    private lateinit var satFunctions: SatFunctions

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        satFunctions = SatFunctions(this)
        setContentView(R.layout.ferramentas)
        button_bloquear = findViewById(R.id.buttonBloquear)
        button_desbloquear = findViewById(R.id.buttonDesbloquear)
        button_log = findViewById(R.id.buttonLog)
        button_atualizar = findViewById(R.id.buttonAtualizar)
        button_versao = findViewById(R.id.buttonVersao)
        txtCodAtivacao = findViewById(R.id.txtCodAtivacao)

        txtCodAtivacao.setText(GlobalValues.codAtivacao)
        fun repostaSat(operacao: String) {
            var retornoOperaca = ""
            when (operacao) {
                "BloquearSat" -> retornoOperaca = satFunctions.bloquearSat(txtCodAtivacao.text.toString(), gerador.nextInt(999999))
                "DesbloquearSat" -> retornoOperaca = satFunctions.desbloquearSat(txtCodAtivacao.text.toString(), gerador.nextInt(999999))
                "ExtrairLog" -> retornoOperaca = satFunctions.extrairLog(txtCodAtivacao.text.toString(), gerador.nextInt(999999))
                "AtualizarSoftware" -> retornoOperaca = satFunctions.atualizarSoftware(txtCodAtivacao.text.toString(), gerador.nextInt(999999))
                "Versao" -> retornoOperaca = satFunctions.versao()
            }
            GlobalValues.codAtivacao = txtCodAtivacao.text.toString()

            val retornoSat = OperacaoSat.invocarOperacaoSat(operacao, retornoOperaca)

            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
            //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
            // Recomenda-se acessar a função e entender como ela funciona
            val retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat!!)
            ComponentsGertec.dialogoRetorno(retornoFormatado, this)
        }

        button_bloquear.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("BloquearSat")
            } else {
                Toast.makeText(this@Ferramentas, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }

        button_desbloquear.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("DesbloquearSat")
            } else {
                Toast.makeText(this@Ferramentas, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }

        button_log.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("ExtrairLog")
            } else {
                Toast.makeText(this@Ferramentas, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }

        button_atualizar.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                repostaSat("AtualizarSoftware")
            } else {
                Toast.makeText(this@Ferramentas, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }

        button_versao.setOnClickListener {
            try {
                repostaSat("Versao")
            } catch (e: Exception) {
                Toast.makeText(this@Ferramentas, "Erro ao verificar versão!", Toast.LENGTH_LONG).show()
            }
        }


    }
}
