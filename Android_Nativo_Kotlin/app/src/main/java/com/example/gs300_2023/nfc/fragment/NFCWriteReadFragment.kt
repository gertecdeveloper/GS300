package com.example.gs300_2023.nfc.fragment

import android.annotation.SuppressLint
import android.content.Context
import android.nfc.FormatException
import android.nfc.tech.Ndef
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.ProgressBar
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.Nullable
import androidx.fragment.app.Fragment
import com.example.gs300_2023.R
import com.example.gs300_2023.nfc.NfcExemplo
import com.example.gs300_2023.nfc.NfcLeituraGravacao
import java.io.IOException

class NFCWriteReadFragment : Fragment() {

    private var nfcLeituraGravacao: NfcLeituraGravacao? = null

    companion object {
        fun newInstance(): NFCWriteReadFragment {
            return NFCWriteReadFragment()
        }
    }

    private lateinit var tvStatus: TextView
    private lateinit var editProcesso: EditText
    private lateinit var mProgress: ProgressBar
    private lateinit var mListener: NfcExemplo

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_forceteste, container, false)
        initViews(view)
        return view
    }

    private fun initViews(view: View) {
        editProcesso = view.findViewById(R.id.editProcesso)
        mProgress = view.findViewById(R.id.progress)
        tvStatus = view.findViewById(R.id.tv_status)
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        mListener = context as NfcExemplo
        mListener.onDialogDisplayed()
    }

    override fun onDetach() {
        super.onDetach()
        mListener.onDialogDismissed()
    }

    fun onNfcDetected(ndef: Ndef, mensagem: String) {
        nfcLeituraGravacao = NfcLeituraGravacao(ndef.tag)
        if (writeToNfc(ndef, mensagem)) {
            readFromNFC(ndef)
        }
    }

    @SuppressLint("NewApi")
    private fun writeToNfc(ndef: Ndef, message: String): Boolean {
        var retorno = false

        try {
            retorno = nfcLeituraGravacao!!.gravaMensagemCartao(ndef, message)

            if (retorno) {
                editProcesso.setText("Código ID: ${nfcLeituraGravacao!!.idCartaoHexadecimal()}\nCódigo gravado: $message\n")
            } else {
                Toast.makeText(activity, "Falha ao gravar mensagem", Toast.LENGTH_LONG).show()
            }

        } catch (e: FormatException) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()

        } catch (e: IOException) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()

        } catch (e: Exception) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        } finally {
            mProgress.visibility = View.GONE
        }

        return retorno
    }
    private fun readFromNFC(ndef: Ndef) {
        var mensagem = ""
        var tempoExecucao: Long

        try {
            mensagem = nfcLeituraGravacao!!.retornaMensagemGravadaCartao(ndef)
            tempoExecucao = nfcLeituraGravacao!!.retornaTempoDeExeculcaoSegundos()!!

            if (mensagem.isEmpty()) {
                tvStatus.text = "Nenhuma mensagem cadastrada."
            } else {
                tvStatus.text = "Aproxime o cartão."
                val editTex = editProcesso.text.toString()
                editProcesso.setText(
                    "$editTex\nCódigo ID: ${nfcLeituraGravacao!!.idCartaoHexadecimal()}\nLeitura código: $mensagem\n" +
                            String.format("\nTempo de execução: %02d segundos", tempoExecucao)
                )
            }

        } catch (e: IOException) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        } catch (e: FormatException) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        } catch (e: Exception) {
            Toast.makeText(activity, e.message, Toast.LENGTH_LONG).show()
        }
    }

}
