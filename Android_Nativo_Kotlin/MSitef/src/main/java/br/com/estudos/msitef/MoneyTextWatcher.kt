package br.com.estudos.msitef

import android.text.Editable
import android.text.TextWatcher
import android.widget.EditText
import java.lang.ref.WeakReference
import java.math.BigDecimal
import java.text.NumberFormat

class MoneyTextWatcher(editText: EditText) : TextWatcher {

    private val editTextWeakReference: WeakReference<EditText> = WeakReference(editText)

    override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {
        // No implementation needed
    }

    override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {
        // No implementation needed
    }

    override fun afterTextChanged(editable: Editable) {
        val editText = editTextWeakReference.get() ?: return
        editText.removeTextChangedListener(this)
        val parsed = parseToBigDecimal(editable.toString().replace("R\\$", ""))
        val formatted = NumberFormat.getCurrencyInstance().format(parsed)
        editText.setText(formatted.replace("R\\$", ""))
        editText.setSelection(formatted.length - 2)
        editText.addTextChangedListener(this)
    }

    private fun parseToBigDecimal(value: String): BigDecimal {
        val replaceable = String.format("[%s,.\\s]", NumberFormat.getCurrencyInstance().currency.symbol)
        val cleanString = value.replace(replaceable.toRegex(), "")
        return BigDecimal(cleanString).setScale(
            2, BigDecimal.ROUND_FLOOR
        ).divide(BigDecimal(100), BigDecimal.ROUND_FLOOR)
    }
}
