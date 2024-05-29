package com.example.easylayer_110_gs300.Impressora;

import static android.widget.Toast.makeText;
import static com.gertec.easylayer.printer.auxiliary.Alignment.CENTER;
import static com.gertec.easylayer.printer.auxiliary.Alignment.LEFT;
import static com.gertec.easylayer.printer.auxiliary.Alignment.RIGHT;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.easylayer_110_gs300.R;
import com.gertec.easylayer.printer.PrintConfig;
import com.gertec.easylayer.printer.Printer;
import com.gertec.easylayer.printer.PrinterError;
import com.gertec.easylayer.printer.PrinterUtils;
import com.gertec.easylayer.printer.auxiliary.Alignment;
import com.gertec.easylayer.printer.auxiliary.BarcodeFormat;
import com.gertec.easylayer.printer.auxiliary.BarcodeType;
import com.gertec.easylayer.printer.auxiliary.Receipt;
import com.gertec.easylayer.printer.auxiliary.TableFormat;
import com.gertec.easylayer.printer.auxiliary.TextFormat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

public class Impressora extends AppCompatActivity implements Printer.Listener {

    private int ret;
    private EditText edTxt;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_impressora);

        //Inicialização da classe Printer
        Printer printer = Printer.getInstance(this, this);

        //Contexto
        Context context = this.getApplicationContext();

        //Inicialização da classe PrinterUtils
        PrinterUtils printerUtils = printer.getPrinterUtils();

        //Inicialização da classe PrintConfig
        PrintConfig printConfig = new PrintConfig();

        //Definição de linhamento
        printConfig.setAlignment(CENTER);

        edTxt = findViewById(R.id.edt_text);

        //Impressão do texto
        Button btn_print_text = findViewById(R.id.btn_print_text);
        btn_print_text.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {

                try {
                    String text = null;
                    if (edTxt.getText().toString().isEmpty()) {
                        makeText(getApplicationContext(), "Digite um texto", Toast.LENGTH_SHORT).show();

                    } else {
                        text = edTxt.getText().toString();

                        //Formato 1
                        TextFormat textFormat = new TextFormat();
                        textFormat.setBold(true);
                        textFormat.setUnderscore(true);
                        textFormat.setFontSize(14);
                        textFormat.setLineSpacing(6);
                        textFormat.setAlignment(CENTER);

                        //Impressão formato 1
                        printer.printText(textFormat, text);

                        //Formato 2
                        TextFormat textFormat2 = new TextFormat();
                        textFormat2.setBold(false);
                        textFormat2.setUnderscore(false);
                        textFormat2.setFontSize(15);
                        textFormat2.setLineSpacing(6);
                        textFormat2.setAlignment(LEFT);

                        //Impressão formato 2
                        printer.printText(textFormat2, text);

                        //Formato 3
                        TextFormat textFormat3 = new TextFormat();
                        textFormat3.setBold(false);
                        textFormat3.setUnderscore(true);
                        textFormat3.setFontSize(16);
                        textFormat3.setLineSpacing(6);
                        textFormat3.setAlignment(RIGHT);

                        //Impressão formato 3
                        printer.printText(textFormat3, text);
                        printer.scrollPaper(5);

                        makeText(getApplicationContext(), "Imprimindo", Toast.LENGTH_SHORT).show();

                    }
                } catch (Exception e) {
                    //Mensagem de erro
                    e.printStackTrace();
                    Log.i(String.valueOf(getApplicationContext()), "onClick: Erro ao imprimir");
                }
            }
        });

        //Botão de imprimir cupom
        Button btn_print_cupom = findViewById(R.id.btn_print_cupom);
        btn_print_cupom.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    //Formatação do cupom
                    ArrayList<String> listItens = new ArrayList<>();
                    listItens.add("001 00345 1 cx (1,25) - Pasta de alho");
                    listItens.add("002 00345 1 cx (5,00) - Bife de figado");
                    listItens.add("003 00345 1 cx (1,25) - Creme de barbear");
                    listItens.add("004 00345 1 cx (1,25) - Creme Hidratante");
                    listItens.add("005 00345 1 cx (1,25) - Bolacha negresco");
                    listItens.add("006 00345 1 cx (1,25) - Peito de frango");

                    ArrayList<String> listItensValue = new ArrayList<>();
                    listItensValue.add("7,00");
                    listItensValue.add("15,00");
                    listItensValue.add("15,00");
                    listItensValue.add("10,00");
                    listItensValue.add("5,00");
                    listItensValue.add("18,00");

                    Receipt cupom = new Receipt();
                    cupom.setListItens(listItens);
                    cupom.setListValueItens(listItensValue);

                    //Imprimir cupom
                    printer.printXml(cupom);

                    makeText(getApplicationContext(), "Imprimindo", Toast.LENGTH_SHORT).show();
                } catch (Exception e) {
                    e.printStackTrace();
                    makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
        });

//        //Botão de imprimir HTML
//        Button btn_print_html = findViewById(R.id.btn_print_html);
//        btn_print_html.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//
//                //Formatação do HTML
//                int ret = printer.printHtml(context, "<table border=\"1\">\n" +
//                        "    <tr>\n" +
//                        "        <td>Nome</td>\n" +
//                        "        <td>Idade</td>\n" +
//                        "        <td>Profissão</td>\n" +
//                        "    </tr>\n" +
//                        "    <tr>\n" +
//                        "        <td>Ted</td>\n" +
//                        "        <td>22</td>\n" +
//                        "        <td>Médico</td>\n" +
//                        "    </tr>\n" +
//                        "    <tr>\n" +
//                        "        <td>Ralf</td>\n" +
//                        "        <td>26</td>\n" +
//                        "        <td>Farmacêutico</td>\n" +
//                        "    </tr>\n" +
//                        "</table>");
//                showReturn(ret);
//                printer.scrollPaper(10);
//            }
//        });

        Button btn_print_imagem = findViewById(R.id.btn_print_imagem);
        btn_print_imagem.setOnClickListener(v -> {

            Bitmap coloredBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.gertec_jpg);

            if(coloredBitmap != null) {
                Bitmap monochromaticBitmap = printerUtils.toMonochromatic(coloredBitmap, 0.4);
                int ret = printer.printImageAutoResize(monochromaticBitmap);
                showReturn(ret);
                printer.scrollPaper(6);
            }
        });

        //Botão de imprimir código de barras
        Button btn_barcode = findViewById(R.id.btn_print_barcode);
        btn_barcode.setOnClickListener(view -> {
            try {
                //Implementação
                BarcodeFormat format = new BarcodeFormat(BarcodeType.CODE_128); //code128
                format.setAlignment(Alignment.CENTER); //Alinhado ao centro

                BarcodeFormat format2 = new BarcodeFormat(BarcodeType.QR_CODE); //QR Code
                format2.setAlignment(Alignment.CENTER); //Alinhado ao centro

                //Impressão
                for(BarcodeFormat.Size size : BarcodeFormat.Size.values()) {
                    printer.scrollPaper(1);
                    format.setSize(size);

                    printer.printBarcode(format, "12345");

                    printer.scrollPaper(1);
                    format2.setSize(size);

                    ret = printer.printBarcode(format2, "12345");
                    showReturn(ret);
                }
                printer.scrollPaper(2);

                //Mensagem no log para informar sobre a impressão
                Log.i("Impressão", "Códigos de barra: impressos com sucesso ");

            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        });

//        //Botão de imprimir tabelas
//        Button btn_tabelas = findViewById(R.id.btn_print_tabelas);
//        btn_tabelas.setOnClickListener(view -> {
//            try {
//                //Formatação
//                String[] headerArray = {"H1", "H2", "H3", "H4"};
//                List<String> header = Arrays.asList(headerArray);
//                String[][] rowsArray =
//                        {
//                                {"11", "12", "13", "14"},
//                                {"21", "22", "23", "24"},
//                                {"31", "32", "33", "34"}
//                        };
//                List<List<String>> rows = new ArrayList<>();
//                for(int i = 0; i < rowsArray.length; i++) { rows.add(Arrays.asList(rowsArray[0])); };
//
//                //Impressão
//                TableFormat tableFormat = new TableFormat();
//                tableFormat.setFontSize(30);
//                tableFormat.setHeaderAlignment(RIGHT);
//                tableFormat.setRowAlignment(LEFT);
//
//                //Impressão
//                printer.printTable(context, tableFormat, header, rows);
//
//            } catch (RuntimeException e) {
//                throw new RuntimeException(e);
//            }
//        });

        //Botão de soltar papel
        Button btn_print_scroll = findViewById(R.id.btn_print_scroll);
        btn_print_scroll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                printer.scrollPaper(3);
            }
        });

    }

    //Métododo para mensagem de erro da impressora
    @Override
    public void onPrinterError(PrinterError printerError) {
        String message = String.format(Locale.US, "Id: [%d] | Cause: [\"%s\"]",
                printerError.getRequestId(), printerError.getCause());
        Log.d("[onPrinterError]", message);
    }

    //Métododo para mensagem de impressão com sucesso
    @Override
    public void onPrinterSuccessful(int printerRequestId) {
        String message = String.format(Locale.US, "Id: [%d]", printerRequestId);
        Log.d("[onPrinterSuccessful]", message);
    }

    private void showReturn(int ret) {
        String message = String.format(Locale.US, "Return: [%d]", ret);
        Log.d("[Return]", message);
    }
}
