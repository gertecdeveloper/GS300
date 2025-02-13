package com.example.easylayer_110_gs300.NFC.fragment;

import android.annotation.SuppressLint;
import android.content.Context;
import android.nfc.FormatException;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.example.easylayer_110_gs300.R;
import com.example.easylayer_110_gs300.NFC.NFC;
import com.example.easylayer_110_gs300.NFC.NfcLeituraGravacao;

import java.io.IOException;

public class NFCReadFragment extends Fragment {

    private NfcLeituraGravacao nfcLeituraGravacao;

    public static final String TAG = NFCReadFragment.class.getSimpleName();

    public static NFCReadFragment newInstance() {

        return new NFCReadFragment();
    }

    private TextView mTvMessage;
    private NFC mListener;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_leitura,container,false);
        initViews(view);
        return view;
    }

    private void initViews(View view) {

        mTvMessage = view.findViewById(R.id.tv_message);
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mListener = (NFC) context;
        mListener.onDialogDisplayed();
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener.onDialogDismissed();
    }

    public void onNfcDetected(Tag tag){
        nfcLeituraGravacao = new NfcLeituraGravacao(tag);
        readFromNFC(null, tag);
    }

    public void onNfcDetected(Ndef ndef){
        nfcLeituraGravacao = new NfcLeituraGravacao(ndef.getTag());
        readFromNFC(ndef, null);
    }

    /**
     * Este método irá apresentar na tela as atuais mensagens cadastadas no cartão
     *
     * @param ndef = contém as informações do cartão que acabou de ser lido.
     *
     * @exception IOException
     * @exception FormatException
     * @exception Exception
     *
     * */
    @SuppressLint({"SetTextI18n", "DefaultLocale"})
    private void readFromNFC(Ndef ndef, Tag tag) {

        String mensagem = "";
        String idCarao;
        Long tempoExecucao;

        try {

            // Recebe a leitura das atuais mensagens cadastradas no cartão
            if(ndef != null){
                mensagem = nfcLeituraGravacao.retornaMensagemGravadaCartao(ndef);
            }
            idCarao = nfcLeituraGravacao.idCartaoHexadecimal();

            // Recebe o tempo total de execução da operação de leitura
            tempoExecucao = nfcLeituraGravacao.retornaTempoDeExeculcaoSegundos();

            if(ndef == null) {
                mTvMessage.setText("ID Cartão: " + idCarao);
            }else if(mensagem.equals("")){
               mTvMessage.setText("Não existe mensagem gravada no cartão.");
           }else{
               mTvMessage.setText("ID Cartão: " + idCarao + "\n"+ mensagem+
                       "\n\nTempo de execução: "+String.format("%02d segundos", tempoExecucao));
           }

        } catch (IOException | FormatException e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
        } catch (Exception e) {
            e.printStackTrace();
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
        }
    }


}
