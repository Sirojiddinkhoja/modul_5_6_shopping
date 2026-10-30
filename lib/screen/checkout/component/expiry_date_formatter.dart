import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits=newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited=digits.length>4?digits.substring(0,4):digits;
    var text=limited;
    if(limited.length>2){
      text='${limited.substring(0,2)}/${limited.substring(2)}';
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
