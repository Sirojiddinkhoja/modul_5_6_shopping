import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/models/payment_info.dart';

class PaymentLogo extends StatelessWidget {
  final PaymentType type;
  const PaymentLogo(this.type, {super.key});

  @override
  Widget build(BuildContext context) => switch (type) {
    PaymentType.paypal => const Text("PayPal"),
    PaymentType.mastercard => const Text(
      "🔴🟠",
      style: TextStyle(fontSize: 20),
    ),
    PaymentType.visa => const Text("VISA"),
  };
}
