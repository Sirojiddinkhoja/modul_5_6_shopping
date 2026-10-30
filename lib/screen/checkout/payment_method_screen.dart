import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/models/shipping_address.dart';
import 'package:modul_5_6_shopping/screen/checkout/checkout_screen.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/expiry_date_formatter.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/payment_logo.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/payment_tile.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/required_field.dart';

import '../../models/payment_info.dart';

class PaymentMethodScreen extends StatefulWidget {
  final ShippingAddress address;
  const PaymentMethodScreen({super.key, required this.address});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentType _type = PaymentType.mastercard;
  bool _isDefault = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cardController = TextEditingController();
  final _expireController = TextEditingController();
  final _cvcController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cardController.dispose();
    _expireController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Back"),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: .symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 24),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: .spaceEvenly,
                            children: [
                              PaymentTile(
                                selected: _type == PaymentType.paypal,
                                onTap: () =>
                                    setState(() => _type = PaymentType.paypal),
                                child: PaymentLogo(PaymentType.paypal),
                              ),
                              PaymentTile(
                                selected: _type == PaymentType.mastercard,
                                onTap: () =>
                                    setState(() =>
                                    _type = PaymentType.mastercard),
                                child: PaymentLogo(PaymentType.mastercard),
                              ),
                              PaymentTile(
                                selected: _type == PaymentType.visa,
                                onTap: () =>
                                    setState(() => _type = PaymentType.visa),
                                child: PaymentLogo(PaymentType.visa),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          RequiredField(
                            label: "Name",
                            controller: _nameController,
                            obscureText: false,
                            keyboardType: .name,
                          ),
                          SizedBox(height: 20),
                          RequiredField(
                            label: "Card number",
                            controller: _cardController,
                            keyboardType: .number,
                            obscureText: false,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16),
                            ],
                            validator: (value) =>
                            value!.length == 16
                                ? null
                                : "Enter 16 digits",
                          ),
                          SizedBox(height: 20),
                          RequiredField(
                            label: "Expiry Date",
                            controller: _expireController,
                            obscureText: false,
                            keyboardType: .number,
                            inputFormatters: [ ExpiryDateFormatter()],
                            validator: (value) {
                              if (value!.length != 5) return "Use MM/YY";
                              final month = int.tryParse(value.substring(0, 2));
                              if (month == null || month < 1 || month > 12)
                                return "Invalid month";
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          RequiredField(
                            label: "CVC",
                            controller: _cvcController,
                            keyboardType: .number,
                            obscureText: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            validator: (value) =>
                            value!.length == 3
                                ? null
                                : "Enter 3 digits",
                          ),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: () =>
                                setState(() {
                                  _isDefault = !_isDefault;
                                }),
                            child: Row(children: [
                              Icon(_isDefault?Icons.circle:Icons.circle_outlined, color: AppColors.primary,
                                size: 15,),
                              SizedBox(width: 10,),
                              Text("Set as your default payment method")
                            ],),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: .symmetric(horizontal: 20, vertical: 12),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    debugPrint(widget.address.city);
                    final payment = PaymentInfo(
                      type: _type,
                      name: _nameController.text.trim(),
                      last4: _cardController.text.substring(12,16), expiry: _expireController.text.trim(),
                    );
                    debugPrint('${payment.name} ${payment.last4} ${payment.type} ${payment.expiry}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CheckoutScreen(address: widget.address, payment: payment,)),
                    );
                  }
                },
                child: Text("Next"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

