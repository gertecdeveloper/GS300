package com.example.gs300_2023.sat

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import android.widget.Toast
import br.estudos.satfuncoes.OperacaoSat
import br.estudos.satfuncoes.SatFunctions
import com.example.gs300_2023.Components.ComponentsGertec
import com.example.gs300_2023.GlobalValues
import com.example.gs300_2023.R
import java.util.*

class Alterar : Activity() {
    private lateinit var button_alterar: Button
    private lateinit var txtCodAtual: EditText
    private lateinit var txtCodNovo: EditText
    private lateinit var txtCodConfirmar: EditText
    private lateinit var spinner: Spinner
    private var adapter: ArrayAdapter<String>? = null
    private var opcao = 1
    private val optCod = arrayOf("Código de ativação", "Código de Emergência")
    private val gerador = Random()
    private lateinit var satFunctions: SatFunctions
    private lateinit var context: Context

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        satFunctions = SatFunctions(this)
        setContentView(R.layout.alterar)
        context = this
        txtCodAtual = findViewById(R.id.txtCodAtual)
        txtCodConfirmar = findViewById(R.id.txtCodConfirmar)
        txtCodNovo = findViewById(R.id.txtCodNovo)
        spinner = findViewById(R.id.Spinner1)
        txtCodAtual.setText(GlobalValues.codAtivacao)
        button_alterar = findViewById(R.id.buttonAlterar)
        adapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, optCod)
        adapter?.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner.adapter = adapter

        button_alterar.setOnClickListener {
            try {
                if (txtCodAtual.text.toString().length >= 8 && txtCodNovo.text.toString().length >= 8) {
                    if (txtCodNovo.text.toString() == txtCodConfirmar.text.toString()) {
                        opcao = if (spinner.selectedItem == "Código de ativação") {
                            1
                        } else {
                            2
                        }
                        GlobalValues.codAtivacao = txtCodNovo.text.toString()
                        val resp = satFunctions.trocarCodAtivacao(txtCodAtual.text.toString(), opcao, txtCodNovo.text.toString(), gerador.nextInt(999999))
                        val retornoSat = OperacaoSat.invocarOperacaoSat("TrocarCodAtivacao", resp)

                        //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                        // Recomenda-se acessar a função e entender como ela funciona
                        val retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat!!)
                        ComponentsGertec.dialogoRetorno(retornoFormatado, context)
                    } else {
                        Toast.makeText(this@Alterar, "O Novo Código de Ativação e a Confirmação do Novo Código de Ativação não correspondem!", Toast.LENGTH_LONG).show()
                    }
                } else {
                    Toast.makeText(this@Alterar, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }
}
