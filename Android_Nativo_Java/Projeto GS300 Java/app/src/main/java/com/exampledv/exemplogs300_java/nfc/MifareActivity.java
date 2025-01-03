package com.exampledv.exemplogs300_java.nfc;

import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.nfc.tech.NdefFormatable;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;

import com.exampledv.exemplogs300_java.R;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

public class MifareActivity extends AppCompatActivity {

    // Constantes para mensagens
    private static final String ERROR_TAG_NOT_DETECTED = "Nenhuma tag NFC detectada!";
    private static final String ERROR_WRITE_FAILED = "Erro ao gravar na tag NFC, tente novamente.";
    private static final String ERROR_UNSUPPORTED_NDEF = "A tag NFC não suporta mensagens NDEF.";
    private static final String ERROR_DECODING_MESSAGE = "Erro ao decodificar mensagem NFC.";
    private static final String SUCCESS_WRITE = "Texto gravado com sucesso na tag NFC.";
    private static final String ERROR_NFC_NOT_SUPPORTED = "Dispositivo não suporta NFC.";

    // Componentes de NFC
    private NfcAdapter nfcAdapter;
    private PendingIntent pendingIntent;
    private IntentFilter[] writingTagFilters;
    private boolean writeMode;
    private Tag myTag;

    // Elementos da UI
    private TextView editMessage;
    private TextView nfcContent;
    private Button writeButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mifare);

        // Ativa o modo full screen
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            getWindow().setDecorFitsSystemWindows(false);
        }

        View decorView = getWindow().getDecorView();
        WindowInsetsControllerCompat controller = ViewCompat.getWindowInsetsController(decorView);

        if (controller != null) {
            // Oculta as barras de sistema
            controller.hide(WindowInsetsCompat.Type.systemBars());
            // Permite que as barras apareçam com swipe
            controller.setSystemBarsBehavior(WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
        }

        // Inicializa componentes da UI
        editMessage = findViewById(R.id.edit_message);
        nfcContent = findViewById(R.id.lidoTxt);
        writeButton = findViewById(R.id.gravarBtn);

        // Configura NFC
        nfcAdapter = NfcAdapter.getDefaultAdapter(this);
        if (nfcAdapter == null) {
            Toast.makeText(this, ERROR_NFC_NOT_SUPPORTED, Toast.LENGTH_LONG).show();
            finish();
            return;
        }

        setupNfc();

        // Configura botão de escrita
        writeButton.setOnClickListener(v -> handleWriteButtonClick());
    }

    private void setupNfc() {
        // Configura intenção para capturar eventos NFC
        pendingIntent = PendingIntent.getActivity(this, 0, new Intent(this, getClass()).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP), PendingIntent.FLAG_MUTABLE);
        IntentFilter tagDetected = new IntentFilter(NfcAdapter.ACTION_TAG_DISCOVERED);
        tagDetected.addCategory(Intent.CATEGORY_DEFAULT);
        writingTagFilters = new IntentFilter[]{tagDetected};
    }

    private void handleWriteButtonClick() {
        if (myTag == null) {
            Toast.makeText(this, ERROR_TAG_NOT_DETECTED, Toast.LENGTH_LONG).show();
        } else {
            String textToWrite = editMessage.getText().toString();
            writeToTag(myTag, textToWrite);
        }
    }

    private void readFromIntent(Intent intent) {
        if (intent == null) return;

        String action = intent.getAction();
        if (NfcAdapter.ACTION_TAG_DISCOVERED.equals(action)
                || NfcAdapter.ACTION_TECH_DISCOVERED.equals(action)
                || NfcAdapter.ACTION_NDEF_DISCOVERED.equals(action)) {

            Parcelable[] rawMessages = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES);
            if (rawMessages != null) {
                NdefMessage[] messages = new NdefMessage[rawMessages.length];
                for (int i = 0; i < rawMessages.length; i++) {
                    messages[i] = (NdefMessage) rawMessages[i];
                }
                displayTagContent(messages);
            }
        }
    }

    private void displayTagContent(NdefMessage[] messages) {
        if (messages == null || messages.length == 0) {
            nfcContent.setText("Nenhuma mensagem NDEF encontrada.");
            return;
        }

        try {
            NdefRecord[] records = messages[0].getRecords();
            if (records.length == 0) {
                nfcContent.setText("Nenhum registro na mensagem NDEF.");
                return;
            }

            byte[] payload = records[0].getPayload();

            // Adicione verificações de segurança para o tamanho do payload
            if (payload == null || payload.length < 1) {
                nfcContent.setText("Payload inválido ou vazio.");
                return;
            }

            String textEncoding = ((payload[0] & 128) == 0) ? "UTF-8" : "UTF-16";
            int languageCodeLength = payload[0] & 63;

            // Verifica se o tamanho do languageCodeLength é válido
            if (languageCodeLength >= payload.length) {
                nfcContent.setText("Tamanho do código de idioma é inválido.");
                return;
            }

            // Verifica se o restante do payload é suficiente para o texto
            int textStartIndex = 1 + languageCodeLength;
            if (textStartIndex >= payload.length) {
                nfcContent.setText("Tamanho do payload não contém texto.");
                return;
            }

            // Decodifica o texto
            String text = new String(payload, textStartIndex, payload.length - textStartIndex, textEncoding);
            nfcContent.setText("Conteúdo da Tag: " + text);

        } catch (UnsupportedEncodingException e) {
            Log.e("NFC_READ", "Erro ao decodificar mensagem NFC", e);
            nfcContent.setText(ERROR_DECODING_MESSAGE);
        } catch (Exception e) {
            Log.e("NFC_READ", "Erro inesperado ao processar mensagem NFC", e);
            nfcContent.setText("Erro inesperado ao ler a tag NFC.");
        }
    }


    private void writeToTag(Tag tag, String text) {
        try {
            // Cria um registro NDEF com o texto
            NdefRecord record = NdefRecord.createTextRecord("en", text);

            // Cria a mensagem NDEF
            NdefMessage message = new NdefMessage(new NdefRecord[]{record});

            // Conecta à tag
            Ndef ndef = Ndef.get(tag);

            if (ndef != null) {
                ndef.connect();

                // Verifica se a tag é gravável
                if (!ndef.isWritable()) {
                    Log.e("NFC_WRITE", "A tag não é gravável.");
                    nfcContent.setText("A tag NFC não é gravável.");
                    return;
                }

                // Verifica se há espaço suficiente na tag
                int size = message.toByteArray().length;
                if (ndef.getMaxSize() < size) {
                    Log.e("NFC_WRITE", "Tamanho insuficiente na tag NFC.");
                    nfcContent.setText("A tag NFC não tem espaço suficiente.");
                    return;
                }

                // Grava a mensagem na tag
                ndef.writeNdefMessage(message);
                Log.i("NFC_WRITE", "Mensagem gravada com sucesso!");
                nfcContent.setText("Mensagem gravada na tag NFC!");

                ndef.close();
            } else {
                // Caso a tag não seja NDEF, tenta formatar e gravar
                NdefFormatable format = NdefFormatable.get(tag);
                if (format != null) {
                    format.connect();
                    format.format(message);
                    Log.i("NFC_WRITE", "Tag formatada e mensagem gravada com sucesso!");
                    nfcContent.setText("Tag formatada e mensagem gravada!");
                    format.close();
                } else {
                    Log.e("NFC_WRITE", "A tag não suporta o formato NDEF.");
                    nfcContent.setText("A tag não suporta o formato NDEF.");
                }
            }
        } catch (Exception e) {
            Log.e("NFC_WRITE", "Erro ao gravar na tag NFC", e);
            nfcContent.setText("Erro ao gravar na tag NFC: " + e.getMessage());
        }
    }


    private NdefRecord createRecord(String text) throws UnsupportedEncodingException {
        String lang = "en";
        byte[] textBytes = text.getBytes();
        byte[] langBytes = lang.getBytes(StandardCharsets.US_ASCII);
        int langLength = langBytes.length;
        int textLength = textBytes.length;
        byte[] payload = new byte[1 + langLength + textLength];

        payload[0] = (byte) langLength;
        System.arraycopy(langBytes, 0, payload, 1, langLength);
        System.arraycopy(textBytes, 0, payload, 1 + langLength, textLength);

        return new NdefRecord(NdefRecord.TNF_WELL_KNOWN, NdefRecord.RTD_TEXT, new byte[0], payload);
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        readFromIntent(intent);
        if (NfcAdapter.ACTION_TAG_DISCOVERED.equals(intent.getAction())) {
            myTag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        disableWriteMode();
    }

    @Override
    protected void onResume() {
        super.onResume();
        enableWriteMode();
    }

    private void enableWriteMode() {
        writeMode = true;
        nfcAdapter.enableForegroundDispatch(this, pendingIntent, writingTagFilters, null);
    }

    private void disableWriteMode() {
        writeMode = false;
        nfcAdapter.disableForegroundDispatch(this);
    }
}

