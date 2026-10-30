  import 'package:flutter/material.dart';
  import 'package:modul_5_6_shopping/models/cart_item.dart';
  import 'package:modul_5_6_shopping/models/product.dart';

  class CartController extends ChangeNotifier{
  final  List<CartItem>_items=[];
  List<CartItem> get items=>List.unmodifiable(_items);
  bool get isEmpty=>_items.isEmpty;
  int get count=>_items.length;
  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);
  double get total=>_items.fold(0.0, (sum,item)=>sum+item.sumTotal);
  void add(Product product){
    final index=_items.indexWhere((i)=>i.product.id==product.id);
    if(index==-1){
      _items.add(CartItem(product: product));
    }
    else{
      _items[index].quantity++;
    }
    notifyListeners();
  }

  void remove(int productId){
    _items.removeWhere((i)=>i.product.id==productId);

    notifyListeners();
  }
  void decrement(int productId){
    final index=_items.indexWhere((i)=>i.product.id==productId);
    if(index==-1)return;
    if(_items[index].quantity>1){
      _items[index].quantity--;
    }
    else{
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void increment(int productId){
    final index=_items.indexWhere((i)=>i.product.id==productId);
    if(index==-1){
      return;
    }
    else{
     _items[index].quantity++;
    }
    notifyListeners();
  }
  void clearItems(){
    _items.clear();
    notifyListeners();
  }
  }

  final cart=CartController();