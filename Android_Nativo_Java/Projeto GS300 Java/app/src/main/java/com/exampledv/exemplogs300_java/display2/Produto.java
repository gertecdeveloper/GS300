package com.exampledv.exemplogs300_java.display2;

import android.graphics.Bitmap;

public class Produto {
    Bitmap imagem;
    String nome;
    double preco;

    Produto(Bitmap imagem, String nome, double preco) {
        this.imagem = imagem;
        this.nome = nome;
        this.preco = preco;
    }
}
