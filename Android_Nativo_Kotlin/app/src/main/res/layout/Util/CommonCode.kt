package com.example.gs300_kotlin.Util

class CommonCode {
    val maxLength = 32 // Armazena o tamanho máximo do código de validação
    val minLength = 8 // Armazena o tamanho mínimo do código de validação

    // Verifica se o código de validação do Sat inserido pelo usuário é válido
    // Esta função foi desenvolvida para minimizar a repetição de código
    fun isCodigoValido(codigo: String): Boolean {
        return codigo.length in minLength..maxLength
    }

    // Remove a máscara do CNPJ
    fun removeMaskCnpj(cnpjInput: String): String {
        return cnpjInput.replace(".", "").replace("/", "").replace("-", "")
    }
}
