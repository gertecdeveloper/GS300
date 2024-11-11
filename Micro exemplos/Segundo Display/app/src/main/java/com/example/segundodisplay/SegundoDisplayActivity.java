package com.example.segundodisplay;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.os.Handler;

import androidx.appcompat.app.AppCompatActivity;

import com.android.sublcdlibrary.SubLcdException;
import com.android.sublcdlibrary.SubLcdHelper;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;;

public class SegundoDisplayActivity extends AppCompatActivity implements SubLcdHelper.VuleCalBack{

    private final Queue<Bitmap> displayBuffer = new LinkedList<>();
    private boolean displayBusy = false;
    private static final int MSG_UPDATE_DISPLAY_BUSY_FLAG = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_segundo_display);

        SubLcdHelper.getInstance().init(getApplicationContext());
        SubLcdHelper.getInstance().SetCalBack(this);


        // Crie uma lista de produtos
        List<Produto> produtos = new ArrayList<>();
        produtos.add(new Produto(BitmapFactory.decodeResource(getResources(), R.drawable.detergente), "Detergente", 5.00));
        produtos.add(new Produto(BitmapFactory.decodeResource(getResources(), R.drawable.sabonete), "Sabão", 3.50));
        produtos.add(new Produto(BitmapFactory.decodeResource(getResources(), R.drawable.arroz), "Arroz", 7.00));

// Variável para armazenar o subtotal
        final double[] subtotal = {0.0};

// Variável para armazenar o total geral
        final double[] totalGeral = {0.0};

        final Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            int i = 0;

            @Override
            public void run() {
                // Obtenha o próximo produto
                Produto produto = produtos.get(i);

                // Atualize o subtotal
                subtotal[0] += produto.preco;

                // Atualize o total geral
                totalGeral[0] += produto.preco;

                // Atualize a tela com o novo produto
                sendScreen(produto.imagem, produto.nome, String.format("R$%.2f", produto.preco), String.format("R$%.2f", subtotal[0]));

                // Vá para o próximo produto
                i = (i + 1) % produtos.size();

                // Se todos os produtos foram exibidos, exiba o total geral e reinicie o subtotal
                if (i == 0) {
                    sendScreen(null, "Total de produtos", "", String.format("R$%.2f", totalGeral[0]));
                    subtotal[0] = 0.0;
                }

                // Agende a próxima atualização
                handler.postDelayed(this, 2000);
            }
        }, 1000);


    }

    private void showNextScreenFromBuffer() {
        if (!displayBuffer.isEmpty()) {
            Bitmap nextScreen = displayBuffer.poll(); // Obter a próxima Bitmap (imagem)

            // Certifique-se de que ainda há elementos na fila antes de tentar obter a String de texto
            if (!displayBuffer.isEmpty() && nextScreen != null) {
                Object nextTextObject = displayBuffer.poll(); // Obter o próximo objeto da fila

                if (nextTextObject instanceof String) {
                    String nextText = (String) nextTextObject; // Converter para String (texto)
                    sendScreen(nextScreen, nextText, "", ""); // Enviar a tela com imagem e texto
                } else {

                }
            }
        }
    }

    private final Handler mHandler = new Handler(msg -> {
        if (msg.what == MSG_UPDATE_DISPLAY_BUSY_FLAG) {
            displayBusy = false;
            showNextScreenFromBuffer();
        }
        return false;
    });

    public void sendScreen(Bitmap screen, String productName, String price, String subtotal) {
        if (displayBusy) {
            displayBuffer.clear();
            displayBuffer.add(screen);
            displayBuffer.add(textToBitmap(productName, price, subtotal));
        } else {
            try {
                displayBusy = true;
                Bitmap imageWithText = combineBitmapWithText(screen, productName, price, subtotal);
                SubLcdHelper.getInstance().sendBitmap(SubLcdHelper.getInstance().doRotateBitmap(imageWithText, 90));
                mHandler.sendEmptyMessageDelayed(MSG_UPDATE_DISPLAY_BUSY_FLAG, 2000);
            } catch (SubLcdException e) {
                e.printStackTrace();
                displayBusy = false;
            }
        }
    }

    private Bitmap textToBitmap(String productName, String price, String subtotal) {
        // Exemplo simples: criação de um bitmap com o texto em azul sobre um fundo azul
        int width = 500; // largura do bitmap de texto
        int height = 420; // altura do bitmap de texto

        // Criando um bitmap com o fundo azul
        Bitmap textBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(textBitmap);

        Paint paint = new Paint();
        paint.setColor(Color.BLACK); // Definindo a cor do texto como branca
        paint.setTextSize(30); // Tamanho do texto
        paint.setTextAlign(Paint.Align.LEFT); // Alinhando o texto à esquerda
        // Desenhando o logo
        Bitmap logo = BitmapFactory.decodeResource(getResources(), R.drawable.log_gertec_2); // Substitua R.drawable.logo pelo seu logo

        // Redimensionando o logo
        int logoWidth = 200; // Ajuste a largura do logo aqui
        int logoHeight = 100; // Ajuste a altura do logo aqui
        logo = Bitmap.createScaledBitmap(logo, logoWidth, logoHeight, false);

        // Desenhando o logo redimensionado no topo e centralizado
        int logoTopPosition = 0; // Ajuste a posição superior do logo aqui
        canvas.drawBitmap(logo, (width - logo.getWidth()), logoTopPosition, null);

        // Desenhando o texto do produto
        float y = 100;
        canvas.drawText("Produto:", 20, y, paint);
        paint.setTextSize(50);
        canvas.drawText(productName, 20, y + paint.getTextSize(), paint);

        // Desenhando o texto do preço
        paint.setTextSize(30);
        y += 100;
        canvas.drawText("Preço:", 20, y, paint);
        paint.setTextSize(50);
        canvas.drawText(price, 20, y + paint.getTextSize(), paint);

        // Desenhando uma linha de divisão
        y += 80;
        paint.setStrokeWidth(5); // Ajuste a espessura da linha aqui
        canvas.drawLine(20, y, canvas.getWidth() / 2, y, paint); // Ajuste o tamanho da linha aqui


        // Desenhando o texto do subtotal
        paint.setTextSize(30);
        y += 50;
        canvas.drawText("Subtotal:", 20, y, paint);
        paint.setTextSize(50);
        canvas.drawText(subtotal, 20, y + paint.getTextSize(), paint);


        return textBitmap;
    }

    private Bitmap combineBitmapWithText(Bitmap bitmap, String productName, String price, String subtotal) {
        // Combinando a imagem com o bitmap de texto verticalmente
        Bitmap textBitmap = textToBitmap(productName, price, subtotal);

        Bitmap combinedBitmap = Bitmap.createBitmap(
                bitmap.getWidth() + textBitmap.getWidth(),
                Math.max(bitmap.getHeight(), textBitmap.getHeight()),
                bitmap.getConfig()
        );

        Canvas canvas = new Canvas(combinedBitmap);

        // Desenhando a imagem à direita do fundo
        canvas.drawBitmap(bitmap, combinedBitmap.getWidth() - bitmap.getWidth(), (combinedBitmap.getHeight() - bitmap.getHeight()) / 2, null);

        // Desenhando o bitmap de texto à esquerda da imagem
        canvas.drawBitmap(textBitmap, 0, (combinedBitmap.getHeight() - textBitmap.getHeight()) / 2, null);

        return combinedBitmap;
    }

    @Override
    public void datatrigger(String s, int i) {
        // Implemente o método de callback se necessário
    }
}