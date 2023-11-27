package com.example.gs300_kotlin.msitef

import android.content.Intent
import android.os.Bundle
import android.text.InputType
import android.text.method.DigitsKeyListener
import android.widget.Button
import android.widget.EditText
import android.widget.RadioButton
import android.widget.TextView
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import br.com.estudos.msitef.MSitef
import br.com.estudos.msitef.MoneyTextWatcher
import com.elotouch.AP80.sdkhelper.AP80PrintHelper
import com.example.gs300_kotlin.Mask
import com.example.gs300_kotlin.R
import org.json.JSONException
import java.util.Random
import java.util.regex.Pattern

class Tef : AppCompatActivity() {
    companion object {
        var acao = "venda"
        private const val VENDA = 1
        private const val CANCELAMENTO = 2
        private const val FUNCOES = 3
        private const val REIMPRESSAO = 4
    }

    private val r = Random()
    private val op: String = r.nextInt(99999).toString()
    private lateinit var printHelper: AP80PrintHelper

    private lateinit var txtValorOperacao: EditText
    private lateinit var txtIpServidor: EditText
    private lateinit var txtParcelas: EditText

    private lateinit var btnEnviarTransacao: Button
    private lateinit var btnCancelarTransacao: Button
    private lateinit var btnFuncoes: Button
    private lateinit var btnReimpressao: Button

    private lateinit var rbTodos: RadioButton
    private lateinit var rbCredito: RadioButton
    private lateinit var rbDebito: RadioButton
    private lateinit var rbLoja: RadioButton
    private lateinit var rbAdm: RadioButton

    private lateinit var txtCupom: TextView

    private lateinit var mSitef: MSitef

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tef)
// Inicializa todos os EditText
        txtCupom = findViewById(R.id.txtRetorno)
        txtValorOperacao = findViewById(R.id.txtValorOperacao)
        txtIpServidor = findViewById(R.id.txtIpServidor)
        txtParcelas = findViewById(R.id.txtParcelas)

// Inicializa todos os Buttons
        btnEnviarTransacao = findViewById(R.id.btnEnviarTransacao)
        btnCancelarTransacao = findViewById(R.id.btnCancelarTransacao)
        btnFuncoes = findViewById(R.id.btnFuncoes)
        btnReimpressao = findViewById(R.id.btnReimpressao)

// Inicializa todos os RadioButtons
        rbCredito = findViewById(R.id.rbCredito)
        rbDebito = findViewById(R.id.rbDebito)
        rbTodos = findViewById(R.id.rbTodos)
        rbLoja = findViewById(R.id.radioLoja)
        rbAdm = findViewById(R.id.radioAdm)

        printHelper = AP80PrintHelper.getInstance()
        printHelper.initPrint(this)

        maskTextEdits()
        txtValorOperacao.hint = ""
        txtValorOperacao.setText("1")
        txtIpServidor.setText("192.168.13.107")
        rbAdm.isChecked = true
        txtIpServidor.inputType = InputType.TYPE_CLASS_NUMBER
        txtIpServidor.keyListener = DigitsKeyListener.getInstance("0123456789.")

        rbDebito.setOnCheckedChangeListener { _, _ ->
            if (rbTodos.isChecked || rbDebito.isChecked) {
                txtParcelas.setText("1")
                txtParcelas.isEnabled = false
            } else {
                txtParcelas.isEnabled = true
            }
        }

        rbTodos.setOnCheckedChangeListener { _, _ ->
            if (rbTodos.isChecked || rbDebito.isChecked) {
                txtParcelas.setText("1")
                txtParcelas.isEnabled = false
            } else {
                txtParcelas.isEnabled = true
            }
        }

        btnEnviarTransacao.setOnClickListener {
            acao = "venda"
            if (Mask.unmask(txtValorOperacao.text.toString()) == "000") {
                dialogoErro("O valor de venda digitado deve ser maior que 0")
            } else if (!validaIp(txtIpServidor.text.toString())) {
                dialogoErro("Digite um IP válido")
            } else {
                if (rbCredito.isChecked && (txtParcelas.text.toString()
                        .isEmpty() || txtParcelas.text.toString() == "0")
                ) {
                    dialogoErro("É necessário colocar o número de parcelas desejadas (obs.: Opção de compra por crédito marcada)")
                } else {
                    executaTEF(VENDA)
                }
            }
        }

        btnCancelarTransacao.setOnClickListener {
            acao = "cancelamento"
            if (Mask.unmask(txtValorOperacao.text.toString()) == "000") {
                dialogoErro("O valor de venda digitado deve ser maior que 0")
            } else if (!validaIp(txtIpServidor.text.toString())) {
                dialogoErro("Digite um IP válido")
            } else {
                executaTEF(CANCELAMENTO)
            }
        }

        btnFuncoes.setOnClickListener {
            acao = "funcoes"
            if (Mask.unmask(txtValorOperacao.text.toString()) == "000") {
                dialogoErro("O valor de venda digitado deve ser maior que 0")
            } else if (!validaIp(txtIpServidor.text.toString())) {
                dialogoErro("Digite um IP válido")
            } else {
                executaTEF(FUNCOES)
            }
        }

        btnReimpressao.setOnClickListener {
            acao = "reimpressao"
            if (Mask.unmask(txtValorOperacao.text.toString()) == "000") {
                dialogoErro("O valor de venda digitado deve ser maior que 0")
            } else if (!validaIp(txtIpServidor.text.toString())) {
                dialogoErro("Digite um IP válido")
            } else {
                executaTEF(REIMPRESSAO)
            }


        }
    }
        override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
            super.onActivityResult(requestCode, resultCode, data)

            try {
                if (requestCode == MSitef.REQ_CODE_MSITEF && data != null) {
                    val retornoSitef = mSitef.traduzRetornoMSitef(data)
                    if (resultCode == RESULT_OK) {
                        if (retornoSitef.getCodResp() == "0") {
                            var impressao = ""
                            // Verifica se tem algo pra imprimir
                            if (!retornoSitef.textoImpressoCliente()!!.isNotEmpty()) {
                                impressao += retornoSitef.textoImpressoCliente()
                            }
                            if (!retornoSitef.textoImpressoEstabelecimento()!!.isNotEmpty()) {
                                impressao += "\n\n-----------------------------     \n"
                                impressao += retornoSitef.textoImpressoEstabelecimento()
                            }

                            txtCupom.text = impressao
                            printHelper.printData(impressao, 25, 0, false, 1, 80, 0)
                            printSpace(7)
                            printHelper.printStart()
                            printHelper.cutPaper(1)
                        }
                        // Verifica se ocorreu um erro durante venda ou cancelamento
                        if (acao == "venda" || acao == "cancelamento") {
                            if (retornoSitef.getCodResp()!!.isEmpty() || retornoSitef.getCodResp() != "0" || retornoSitef.getCodResp() == null) {
                                mSitef.dialodTransacaoNegadaMsitef(retornoSitef)
                            } else {
                                mSitef.dialodTransacaoAprovadaMsitef(retornoSitef)
                            }
                        }
                    } else {
                        // ocorreu um erro
                        if (acao == "venda" || acao == "cancelamento") {
                            mSitef.dialodTransacaoNegadaMsitef(retornoSitef)
                        }
                    }
                }
            } catch (e: JSONException) {
                e.printStackTrace()
            }
        }

    fun validaIp(ipserver: String): Boolean {
        val p = Pattern.compile("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$")
        val m = p.matcher(ipserver)
        return m.matches()
    }

    private fun maskTextEdits() {
        txtValorOperacao.addTextChangedListener(MoneyTextWatcher(txtValorOperacao))
    }

    private fun executaTEF(operacao: Int) {
        val bundle = Bundle()

        bundle.putCharSequence("empresaSitef", "00000000")
        bundle.putCharSequence("enderecoSitef", txtIpServidor.text.toString().replace("\\s+".toRegex(), ""))
        bundle.putCharSequence("operador", "0001")
        bundle.putCharSequence("data", "20200324")
        bundle.putCharSequence("hora", "130358")
        bundle.putCharSequence("numeroCupom", op)
        bundle.putCharSequence("comExterna", "0") // 0 – Sem (apenas para SiTef dedicado)
        bundle.putCharSequence("CNPJ_CPF", "03654119000176") // CNPJ ou CPF do estabelecimento.

        when (operacao) {
            VENDA -> {
                bundle.putCharSequence("valor", "001")  // Valor da operação

                if (rbCredito.isChecked) {
                    bundle.putCharSequence("valor", "001")  // Valor da operação
                    bundle.putCharSequence("modalidade", "3")  // Funcionalidade da CliSiTef que deseja executar

                    if (txtParcelas.text.toString() == "0" || txtParcelas.text.toString() == "1") {
                        bundle.putCharSequence("transacoesHabilitadas", "26")  // Opções de pagamento que serão habilitadas
                    } else if (rbLoja.isChecked) {
                        bundle.putCharSequence("transacoesHabilitadas", "26")  // Opções de pagamento que serão habilitadas
                    } else if (rbAdm.isChecked) {
                        bundle.putCharSequence("transacoesHabilitadas", "26")  // Opções de pagamento que serão habilitadas
                    }
                    bundle.putCharSequence("numParcelas", txtParcelas.text.toString())  // Número de parcelas
                }

                if (rbDebito!!.isChecked) {
                    bundle.putCharSequence("modalidade", "2")  // Funcionalidade da CliSiTef que deseja executar
                    bundle.putCharSequence("transacoesHabilitadas", "16")  // Funcionalidade da CliSiTef que deseja executar
                }

                if (rbTodos!!.isChecked) {
                    bundle.putCharSequence("modalidade", "0")  // Funcionalidade da CliSiTef que deseja executar
                }
            }

            CANCELAMENTO -> {
                bundle.putCharSequence("modalidade", "200")  // Funcionalidade da CliSiTef que deseja executar
            }
            FUNCOES -> {
                bundle.putCharSequence("modalidade", "110")  // Funcionalidade da CliSiTef que deseja executar
            }

            REIMPRESSAO -> {
                bundle.putCharSequence("modalidade", "114")  // Funcionalidade da CliSiTef que deseja executar
            }
        }

        bundle.putCharSequence("isDoubleValidation", "0")
        bundle.putCharSequence("caminhoCertificadoCA", "ca_cert_perm")
        bundle.putCharSequence("cnpj_automacao", "03654119000176")  // CNPJ da empresa que desenvolveu a automação comercial.

        mSitef = MSitef(this)
        try {
            mSitef.executaTEF(bundle)
        } catch (e: Exception) {
            txtCupom!!.text = e.message
        }
    }
    fun dialogoErro(msg: String) {
        val alertDialog = AlertDialog.Builder(this).create()
        alertDialog.setTitle("Erro ao executar função.")
        alertDialog.setMessage(msg)
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK") { _, i ->
            // Não existe nenhuma ação
        }
        alertDialog.show()
    }

    private fun printSpace(n: Int) {
        if (n < 0) {
            return
        }
        val str_space = StringBuilder()
        for (i in 0 until n) {
            str_space.append("\n")
        }
        printHelper.printData(str_space.toString(), 32, 0, false, 1, 80, 0)
    }
    }