import 'package:flutter/material.dart';
import 'package:modul_5_6_shopping/config/app_colors.dart';
import 'package:modul_5_6_shopping/models/product.dart';
import 'package:modul_5_6_shopping/screen/product_detail_screen/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetailScreen(product: product))
        );
      },
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Expanded(child: Container(
            width: double.infinity,
          decoration: BoxDecoration(
            color: product.bgColor,
            borderRadius: .circular(30)
          ),
            child: Center(
              child: Text(product.image,style: TextStyle(fontSize: 72),),
            ),
          ),
          ),
          SizedBox(height: 12,),
          Padding(padding: .symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text("\$${product.price.toStringAsFixed(2)}",style:
                TextStyle(color: AppColors.textDark,fontSize: 20,fontWeight: FontWeight.w500),),
              const Icon(Icons.more_horiz,color: Colors.grey,)
            ],
          ),
          )
        ],
      ),
    );
  }
}
