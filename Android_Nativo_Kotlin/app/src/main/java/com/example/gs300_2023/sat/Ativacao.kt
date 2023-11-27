package com.example.gs300_2023.sat

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.text.TextWatcher
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import br.estudos.satfuncoes.OperacaoSat
import br.estudos.satfuncoes.SatFunctions
import com.example.gs300_2023.Components.ComponentsGertec
import com.example.gs300_2023.GlobalValues
import com.example.gs300_2023.Mask
import com.example.gs300_2023.R
import com.example.gs300_2023.util.CommonCode


import java.util.*

class Ativacao : Activity() {
    private var cnpjMask: TextWatcher? = null
    private lateinit var button_ativar: Button
    private lateinit var txtCodAtivacao: EditText
    private lateinit var txtConfCodAtivacao: EditText
    private val gerador = Random()
    private lateinit var satFunctions: SatFunctions
    private val commonCode = CommonCode()
    private lateinit var context: Context

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        satFunctions = SatFunctions(this)
        setContentView(R.layout.ativacao)
        context = this
        button_ativar = findViewById(R.id.buttonAtivar)
        txtCodAtivacao = findViewById(R.id.txtCodAtivacao)
        txtConfCodAtivacao = findViewById(R.id.txtConfCodAtivacao)
        val editCnpj = findViewById<EditText>(R.id.txtCNPJ)
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpj)
        editCnpj.addTextChangedListener(cnpjMask)
        txtCodAtivacao.setText(GlobalValues.codAtivacao)

        button_ativar.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                if (txtCodAtivacao.text.toString() == txtConfCodAtivacao.text.toString()) {
                    GlobalValues.codAtivacao = txtCodAtivacao.text.toString()
                    val resp = satFunctions.ativarSat(txtCodAtivacao.text.toString(), commonCode.removeMaskCnpj(editCnpj.text.toString()), gerador.nextInt(999999))
                    val retornoSat = OperacaoSat.invocarOperacaoSat("AtivarSAT", resp)

                    //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                    //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                    // Recomenda-se acessar a função e entender como ela funciona
                    val retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat!!)
                    println(retornoFormatado)
                    ComponentsGertec.dialogoRetorno(retornoFormatado, context)
                } else {
                    Toast.makeText(this@Ativacao, "O Código de Ativação e a Confirmação do Código de Ativação não correspondem!", Toast.LENGTH_LONG).show()
                }
            } else {
                Toast.makeText(this@Ativacao, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }
    }
}
