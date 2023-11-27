package com.example.gs300_2023.sat


import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.text.TextWatcher
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import br.estudos.satfuncoes.SatFunctions
import com.example.gs300_2023.GlobalValues
import com.example.gs300_2023.Mask
import com.example.gs300_2023.R
import com.example.gs300_2023.util.CommonCode
import java.util.*

class Associar : Activity() {

    private var cnpjMask: TextWatcher? = null
    private lateinit var button_associar: Button
    private lateinit var txtCodAtivacao: EditText
    private lateinit var txtAssinatura: EditText
    private lateinit var alerta: AlertDialog
    private val gerador = Random()
    private lateinit var satFunctions: SatFunctions
    private val commonCode = CommonCode()
    private lateinit var context: Context

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        satFunctions = SatFunctions(this)
        setContentView(R.layout.assinatura)
        button_associar = findViewById(R.id.buttonAssociar)
        txtCodAtivacao = findViewById(R.id.txtCodAtivacao)
        txtAssinatura = findViewById(R.id.txtAssinatura)
        val editCnpj = findViewById<EditText>(R.id.txtCNPJ)
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpj)
        editCnpj.addTextChangedListener(cnpjMask)
        val editCnpjSW = findViewById<EditText>(R.id.txtSW)
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpjSW)
        editCnpjSW.addTextChangedListener(cnpjMask)
        txtCodAtivacao.setText(GlobalValues.codAtivacao)
        context = this
        button_associar.setOnClickListener {
            if (txtCodAtivacao.text.toString().length >= 8) {
                if (txtAssinatura.text.toString().isNotEmpty()) {

                    GlobalValues.codAtivacao = txtCodAtivacao.text.toString()
                    val resp = satFunctions.associarSat(
                        commonCode.removeMaskCnpj(editCnpj.text.toString()),
                        commonCode.removeMaskCnpj(editCnpjSW.text.toString()),
                        txtCodAtivacao.text.toString(), txtAssinatura.text.toString(),
                        gerador.nextInt(999999)
                    )
               //     val retornoSat = OperacaoSat.invocarOperacaoSat("AssociarSAT", resp)

                    //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                    //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                    // Recomenda-se acessar a função e entender como ela funciona
                   // val retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat)
                   // ComponentsGertec.dialogoRetorno(retornoFormatado, context)

                } else {
                    Toast.makeText(this@Associar, "Assinatura AC Inválida!", Toast.LENGTH_LONG).show()
                }
            } else {
                Toast.makeText(this@Associar, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show()
            }
        }
    }
}
