import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/component/confirm_dialog.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/screen/cart_screen/component/cart_tile.dart';
import 'package:modul_5_6_shopping/screen/cart_screen/component/empty_cart.dart';
import 'package:modul_5_6_shopping/screen/checkout/shipping_adress_screen.dart';

import 'component/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cart,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text("Back"),
            titleSpacing: 0,
          ),
          body:cart.isEmpty?EmptyCart(onExplore: ()=>Navigator.popUntil(context,(route)=>route.isFirst)):
          Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: .symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Your Cart",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDark,
                          ),
                        ),
                        Text(
                          "${cart.totalQuantity} items",
                          style: TextStyle(color: AppColors.greyTitle),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        if (cart.isEmpty) return;
                        final confirmed = await showConfirmDialog(context,
                            title: "Empty cart",
                            message: "Are you sure you want to delete all items in your cart?",
                            confirmText: "Empty Cart");
                        if(confirmed)cart.clearItems();
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              ),
              Divider(height: 35),
              Expanded(
                child: ListView.separated(
                  padding: .symmetric(horizontal: 20),
                  separatorBuilder: (_, __) => SizedBox(height: 24),
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) {
                    final item = cart.items[i];
                    return CartTile(
                      item: item,
                      onIncrement: () => cart.increment(item.product.id),
                      onDelete: () async {
                        if (item.quantity > 1) {
                          cart.decrement(item.product.id);
                          return;
                        }
                        final confirmed = await showConfirmDialog(
                          context,
                          title: 'Delete "${item.product.name}"',
                          message:
                          'Are you sure you want to delete "${item.product
                              .name}" from your cart?',
                          confirmText: "Delete",
                        );
                        if (confirmed) {
                          cart.remove(item.product.id);
                        }
                      },
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: .symmetric(horizontal: 20, vertical: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(64),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ShippingAddressScreen()));
                    },
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        const Text('Check Out', style: TextStyle(fontSize: 12)),
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
      },
    );
  }
}
