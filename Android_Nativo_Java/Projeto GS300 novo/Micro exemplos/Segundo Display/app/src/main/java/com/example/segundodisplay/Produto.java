package com.example.segundodisplay;

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
