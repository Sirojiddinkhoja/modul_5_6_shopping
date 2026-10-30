import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/models/payment_info.dart';
import 'package:modul_5_6_shopping/models/shipping_address.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/checkout_section.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/payment_logo.dart';
import 'package:modul_5_6_shopping/screen/checkout/component/payment_tile.dart';

import '../../config/app_colors.dart';
import '../cart_screen/component/cart_controller.dart';
import 'order_placed_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final ShippingAddress address;
  final PaymentInfo payment;

  const CheckoutScreen({
    super.key,
    required this.address,
    required this.payment,
  });

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
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: .symmetric(horizontal: 20),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  const Divider(height: 35),
                  CheckoutSection(
                    title: "Shipping Address",
                    onChange: () {},
                    child: Text(
                      "${address.city}, str. ${address.street}\n"
                      "${address.postcode} ${address.city}, ${address.country}",
                    ),
                  ),
                  Divider(height: 35),
                  CheckoutSection(
                    title: "Payment",
                    onChange: () {},
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        PaymentTile(
                          selected: false,
                          onTap: () {},
                          child: PaymentLogo(payment.type),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "**** **** **** ${payment.last4}\n"
                          "${payment.name}\n"
                          "${payment.expiry}",
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 35),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Review Products",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      padding: .symmetric(horizontal: 20),
                      scrollDirection: .horizontal,
                      itemBuilder: (context, i) {
                        final product = cart.items[i].product;
                        return Container(
                          width: 100,
                          alignment: .center,
                          decoration: BoxDecoration(
                            color: product.bgColor,
                            borderRadius: .circular(20),
                          ),
                          child: Text(
                            product.image,
                            style: TextStyle(fontSize: 40),
                          ),
                        );
                      },
                      separatorBuilder: (__, _) => SizedBox(width: 16),
                      itemCount: cart.items.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: .symmetric(horizontal: 20, vertical: 12),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>OrderPlacedScreen()), (route)=>route.isFirst);
                  cart.clearItems();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: .fromHeight(64)
                ),
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Text('Place Order', style: TextStyle(fontSize: 12)),
                    Text(
                      '\$${cart.total.toInt()}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
