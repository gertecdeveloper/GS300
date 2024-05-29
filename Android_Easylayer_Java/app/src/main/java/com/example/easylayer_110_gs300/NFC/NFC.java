package com.example.easylayer_110_gs300.NFC;

import android.annotation.SuppressLint;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.FormatException;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.fragment.app.FragmentTransaction;

import com.example.easylayer_110_gs300.MainActivity;
import com.example.easylayer_110_gs300.NFC.fragment.NFCFormatFragment;
import com.example.easylayer_110_gs300.NFC.fragment.NFCReadFragment;
import com.example.easylayer_110_gs300.NFC.fragment.NFCWriteFragment;
import com.example.easylayer_110_gs300.NFC.fragment.NFCWriteReadFragment;
import com.example.easylayer_110_gs300.R;

import java.io.IOException;

public class NFC extends AppCompatActivity {

    private EditText editMesagemPadrao;
    private Button btn_ler;
    private Button btn_gravar;
    private Button btn_forceteste;
    private Button btn_formatarCartao;

    private boolean isDialogDisplayed = false;
    private boolean isWrite = false;
    private boolean isRead = false;
    private boolean isFormat = false;
    private boolean isForceTeste = false;

    private NFCWriteFragment mNfcWriteFragment;
    private NFCReadFragment mNfcReadFragment;
    private NFCWriteReadFragment nfcWriteReadFragment;
    private NFCFormatFragment nfcFormatFragment;

    private NfcAdapter mNfcAdapter;

    private static final String MENSAGEM_PADRAO = "GERTEC";
    private int processo = 1000;
    private byte[] getID;


    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nfc);

        editMesagemPadrao = (EditText) findViewById(R.id.editMensagemPadrao);
        btn_ler = (Button) findViewById(R.id.btn_leitura);
        btn_gravar = (Button) findViewById(R.id.btn_gravar);
        btn_forceteste = (Button) findViewById(R.id.btn_teste);
        btn_formatarCartao = (Button) findViewById(R.id.btn_formatarCartao);
        editMesagemPadrao.setEnabled(false);

        initViews();
        initNFC();
    }

    private void initViews() {

        //Botão de gravar
        btn_gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showWriteFragment();
            }
        });

        //Botão de teste
        btn_forceteste.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showReadWriteFragment();
            }
        });

        //Botão de formatar
        btn_formatarCartao.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showFormatFragment();
            }
        });

        //Botão para ler
        btn_ler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showReadFragment();
            }
        });
    }

    private void initNFC() {
        mNfcAdapter = NfcAdapter.getDefaultAdapter(this);
    }

    private void showWriteFragment() {

        isWrite = true;
        isRead = false;
        isForceTeste = false;
        isFormat = false;
        editMesagemPadrao.setEnabled(true);
        mNfcWriteFragment = new NFCWriteFragment();
    ;
    }

    private void showReadFragment() {

        isRead = true;
        isWrite = false;
        isForceTeste = false;
        isFormat = false;
        mNfcReadFragment = new NFCReadFragment();
        FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
        transaction = getSupportFragmentManager().beginTransaction();
        transaction.replace(R.id.viewer, mNfcReadFragment);
        transaction.addToBackStack(null);
        transaction.commit();

    }

    private void showFormatFragment() {

        isFormat = true;
        isForceTeste = false;
        isRead = false;
        isWrite = false;

        nfcFormatFragment = new NFCFormatFragment();
        FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
        transaction = getSupportFragmentManager().beginTransaction();
        transaction.replace(R.id.viewer, nfcFormatFragment);
        transaction.addToBackStack(null);
        transaction.commit();

    }

    private void showReadWriteFragment() {

        isForceTeste = true;
        isRead = false;
        isWrite = false;
        isFormat = false;
        processo = 1000;

        nfcWriteReadFragment = new NFCWriteReadFragment();
        FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
        transaction = getSupportFragmentManager().beginTransaction();
        transaction.replace(R.id.viewer, nfcWriteReadFragment);
        transaction.addToBackStack(null);
        transaction.commit();

    }

    public void onDialogDisplayed() {

        isDialogDisplayed = true;
    }

    public void onDialogDismissed() {

        isDialogDisplayed = false;

    }

    @Override
    protected void onResume() {
        super.onResume();
        IntentFilter tagDetected = new IntentFilter(NfcAdapter.ACTION_TAG_DISCOVERED);
        IntentFilter ndefDetected = new IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED);
        IntentFilter techDetected = new IntentFilter(NfcAdapter.ACTION_TECH_DISCOVERED);
        IntentFilter idDetected = new IntentFilter((NfcAdapter.EXTRA_ID));
        IntentFilter[] nfcIntentFilter = new IntentFilter[]{techDetected, tagDetected,
                ndefDetected, idDetected};

        PendingIntent pendingIntent = PendingIntent.getActivity(
                this, 0, new Intent(this, getClass()).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP),
                PendingIntent.FLAG_MUTABLE);
        if (mNfcAdapter != null)
            mNfcAdapter.enableForegroundDispatch(this, pendingIntent, nfcIntentFilter, null);

    }

    @Override
    protected void onPause() {
        super.onPause();
        if (mNfcAdapter != null)
            mNfcAdapter.disableForegroundDispatch(this);
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Tag tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);

        Log.d("TAG", "onNewIntent: " + intent.getAction());

        if (tag != null) {

            Ndef ndef = Ndef.get(tag);

            if (isDialogDisplayed) {

                if (isWrite) {

                    String messageToWrite = editMesagemPadrao.getText().toString();
                    if (messageToWrite.equals("")) {
                        Toast.makeText(getApplicationContext(), "Preencha uma mensagem",
                                Toast.LENGTH_SHORT).show();
                    } else {
                        if (ndef == null) {
                            Toast.makeText(getApplicationContext(), "Tipo de cartão não suportado" +
                                    ".", Toast.LENGTH_SHORT).show();
                            return;
                        }

                        mNfcWriteFragment.onNfcDetected(ndef, messageToWrite);
                    }

                } else if (isRead) {

                    if (ndef == null) {
                        mNfcReadFragment.onNfcDetected(tag);
                    }else if (tag == null){
                        mNfcReadFragment.onNfcDetected(ndef);
                    }else {
                        Toast.makeText(getApplicationContext(), "Tipo de cartão não suportado.",
                                Toast.LENGTH_SHORT).show();
                        return;
                    }


                } else if (isForceTeste) {
                    if (ndef == null) {
                        Toast.makeText(getApplicationContext(), "Tipo de cartão não suportado.",
                                Toast.LENGTH_SHORT).show();
                        return;
                    }

                    nfcWriteReadFragment.onNfcDetected(ndef,
                            MENSAGEM_PADRAO + String.valueOf(processo));
                    processo--;

                } else if (isFormat) {
                    if (ndef == null) {
                        Toast.makeText(getApplicationContext(), "Tipo de cartão não suportado.",
                                Toast.LENGTH_SHORT).show();
                        return;
                    }
                    nfcFormatFragment.onNfcDetected(ndef);
                }
            }
        }
    }

}
