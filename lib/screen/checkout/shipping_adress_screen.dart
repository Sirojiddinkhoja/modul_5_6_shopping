import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/models/shipping_address.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/required_field.dart';
import 'package:modul_5_6_shopping/screen/checkout/payment_method_screen.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _townController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _streetController = TextEditingController();
  String? _country = "Germany";
  final _countries = ['Germany', 'France', 'Italy', 'Spain', 'Poland'];

  @override
  void dispose() {
    _townController.dispose();
    _postCodeController.dispose();
    _streetController.dispose();
    super.dispose();
  }

  final labelStyle = TextStyle(fontSize: 18, color: AppColors.greyTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text("Back"), titleSpacing: 0),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: .symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Shipping Address",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      Divider(),
                      DropdownButtonFormField(
                        initialValue: _country,
                        items: _countries
                            .map(
                              (c) => DropdownMenuItem(value: c, child: Text(c)),
                            )
                            .toList(),
                        onChanged: (value) => setState(() {
                          _country = value;
                        }),
                        validator: (value) =>
                            value == null ? "Select a country" : null,
                        decoration: InputDecoration(
                          labelText: "Country",
                          labelStyle: labelStyle,
                        ),
                      ),
                      SizedBox(height: 10),
                      RequiredField(
                        label: "Town / City",
                        controller: _townController,
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
                      RequiredField(
                        label: "Postcode",
                        controller: _postCodeController,
                        keyboardType: .number,
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
                      RequiredField(
                        label: "Street",
                        controller: _streetController,
                        obscureText: false,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "This will be your default shipping address.\nThis will be your default billing address.",
                        style: TextStyle(
                          color: AppColors.greyTitle,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PaymentMethodScreen(
                          address: ShippingAddress(
                            country: _country!,
                            city: _townController.text.trim(),
                            postcode: _postCodeController.text.trim(),
                            street: _streetController.text.trim(),
                          ),
                        ),
                      ),
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
