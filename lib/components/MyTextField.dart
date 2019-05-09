import 'package:flutter/material.dart';

class TextFieldFixCursorSelection extends StatelessWidget {
  TextFieldFixCursorSelection({
    Key key,
    this.value = "",
    this.onChanged,
    this.textAlign = TextAlign.end,
    this.textInputType = TextInputType.text,
    this.suffixText,
  }) : super(key:key);

  final String value, suffixText;
  final void Function(String newValue) onChanged;
  final TextAlign textAlign;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController.fromValue(TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length - 1))),
      onChanged: onChanged,
      textAlign: textAlign,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixText: suffixText
      ),
    );
  }
}