// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/product_card.dart';
// import 'package:shop_ecommerce/product_detail.dart';
// import 'package:shop_ecommerce/cart.dart';

// List<Map<String, Object>> cart = [];

// void addToCart(Map<String, Object> product) {
//   int index = cart.indexWhere((item) => item['id'] == product['id']);
//   if (index != -1) {
//     cart[index]['quantity'] = (cart[index]['quantity'] as int) + 1;
//   } else {
//     product['quantity'] = 1;
//     cart.add(product);
//   }
// }

// int getTotalItemCount() {
//   int totalCount = 0;
//   for (var item in cart) {
//     totalCount += item['quantity'] as int;
//   }
//   return totalCount;
// }



import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/checkoutpage.dart';
// import 'package:shop_ecommerce/cart_count.dart';


// Mock data for products (replace with your actual product data)
List<Map<String, Object>> cart = [];

void addToCart(Map<String, Object> product) {
  int index = cart.indexWhere((item) => item['id'] == product['id']);
  if (index != -1) {
    cart[index]['quantity'] = (cart[index]['quantity'] as int) + 1;
  } else {
    product['quantity'] = 1;
    cart.add(product);
  }
}

class CartCount extends StatefulWidget {
  // const CartCount({Key? key}) : super(key: key);
    const CartCount({super.key});

  @override
  State<CartCount> createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  double calculateTotalAmount() {
    double total = 0;
    for (var item in cart) {
      total += (item['price'] as double) * (item['quantity'] as int);
    }
    return total;
  }

  int getTotalItemCount() {
    int totalCount = 0;
    for (var item in cart) {
      totalCount += item['quantity'] as int;
    }
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    
    );
  }
}









































































































