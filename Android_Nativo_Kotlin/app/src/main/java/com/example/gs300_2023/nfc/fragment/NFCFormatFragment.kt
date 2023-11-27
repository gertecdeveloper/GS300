package com.example.gs300_2023.nfc.fragment



import android.content.Context
import android.nfc.FormatException
import android.nfc.tech.Ndef
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.example.gs300_2023.R
import com.example.gs300_2023.nfc.NfcExemplo
import com.example.gs300_2023.nfc.NfcLeituraGravacao
import java.io.IOException

class NFCFormatFragment : Fragment() {

    private var nfcLeituraGravacao: NfcLeituraGravacao? = null

    companion object {
        fun newInstance(): NFCFormatFragment {
            return NFCFormatFragment()
        }
    }

    private lateinit var view: View
    private lateinit var texMensagem: TextView
    private lateinit var mListener: NfcExemplo

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        view = inflater.inflate(R.layout.fragment_formata, container, false)
        initViews(view)
        return view
    }

    private fun initViews(view: View) {
        texMensagem = view.findViewById(R.id.tv_message)
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

    fun onNfcDetected(ndef: Ndef) {
        nfcLeituraGravacao = NfcLeituraGravacao(ndef.tag)
        formatFromNFC(ndef)
    }

    private fun formatFromNFC(ndef: Ndef) {
        try {
            val retorno = nfcLeituraGravacao!!.formataCartao(ndef)

            if (retorno) {
                texMensagem.text = "Cartão formatado"
            } else {
                texMensagem.text = "Não é necessário formatar este cartão."
            }
        } catch (e: IOException) {
            e.printStackTrace()
        } catch (e: FormatException) {
            e.printStackTrace()
        }
    }
}