import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (getTotalItemCount() > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Center(
                        child: Text(
                          getTotalItemCount().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                double itemTotal = (cartItem['price'] as double) * (cartItem['quantity'] as int);

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem['image'] as String),
                  ),
                  title: Text(cartItem['title'] as String),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${(cartItem['price'] as double).toStringAsFixed(2)}'),
                      Text(
                        'Total: \$${itemTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () {
                          setState(() {
                            if (cartItem['quantity'] as int > 1) {
                              cartItem['quantity'] = (cartItem['quantity'] as int) - 1;
                            } else {
                              cart.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text(cartItem['quantity'].toString()),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: () {
                          setState(() {
                            cartItem['quantity'] = (cartItem['quantity'] as int) + 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            cart.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount: \$${calculateTotalAmount().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle place order action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 8, 8, 8),
                    foregroundColor: Colors.white,
                  ),
                  child: const SizedBox(
                    height: 40,
                    child: Center(
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/checkoutpage.dart';
// // import 'checkoutpage.dart';


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

// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   double calculateTotalAmount() {
//     double total = 0;
//     for (var item in cart) {
//       total += (item['price'] as double) * (item['quantity'] as int);
//     }
//     return total;
//   }

//   int getTotalItemCount() {
//     int totalCount = 0;
//     for (var item in cart) {
//       totalCount += item['quantity'] as int;
//     }
//     return totalCount;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cart Page"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: [
//                 const Icon(Icons.shopping_cart),
//                 if (getTotalItemCount() > 0)
//                   Positioned(
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(1),
//                       decoration: const BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(6)),
//                       ),
//                       constraints: const BoxConstraints(
//                         minWidth: 12,
//                         minHeight: 12,
//                       ),
//                       child: Text(
//                         getTotalItemCount().toString(),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 8,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.length,
//               itemBuilder: (context, index) {
//                 final cartItem = cart[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage(cartItem['image'] as String),
//                   ),
//                   title: Text(cartItem['title'] as String),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Price: \$${cartItem['price']}'),
//                       Text(
//                         'Total: \$${calculateTotalAmount().toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.remove_circle),
//                         onPressed: () {
//                           setState(() {
//                             if (cartItem['quantity'] as int > 1) {
//                               cartItem['quantity'] =
//                                   (cartItem['quantity'] as int) - 1;
//                             } else {
//                               cart.removeAt(index);
//                             }
//                           });
//                         },
//                       ),
//                       Text(cartItem['quantity'].toString()),
//                       IconButton(
//                         icon: const Icon(Icons.add_circle),
//                         onPressed: () {
//                           setState(() {
//                             cartItem['quantity'] =
//                                 (cartItem['quantity'] as int) + 1;
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           setState(() {
//                             cart.removeAt(index);
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Row(
//             children: [
//               Material(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         const Color.fromARGB(255, 255, 137, 137),
//                     foregroundColor: Colors.black,
//                   ),
//                   child: const SizedBox(
//                     height: kToolbarHeight,
//                     width: 150,
//                     child: Center(
//                       child: Text(
//                         'Back',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Material(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CheckoutPage(
//                             cart: cart,
//                             totalAmount: calculateTotalAmount(),
//                             subTotal: calculateTotalAmount() * 0.9, // Example discount
//                           ),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 8, 8, 8),
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const SizedBox(
//                       height: kToolbarHeight,
//                       width: 150,
//                       child: Center(
//                         child: Text(
//                           'Place Order',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




























































// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/checkoutpage.dart';

// // Mock data for products (replace with your actual product data)
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

// class Cartpage extends StatefulWidget {
//   const Cartpage({Key? key}) : super(key: key);

//   @override
//   State<Cartpage> createState() => _CartpageState();
// }

// class _CartpageState extends State<Cartpage> {
//   double calculateTotalAmount() {
//     double total = 0;
//     for (var item in cart) {
//       total += (item['price'] as double) * (item['quantity'] as int);
//     }
//     return total;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cart Page"),
//         actions: const [Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Icon(Icons.shopping_cart),
//         )],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.length,
//               itemBuilder: (context, index) {
//                 final cartItem = cart[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage(cartItem['image'] as String),
//                   ),
//                   title: Text(cartItem['title'] as String),
//                   subtitle:Column(
//                     children: [
//                       Text('Price-\$${cartItem['price']}'),
//                       Text('Total: \$${calculateTotalAmount().toStringAsFixed(2)}',
//                style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//                       )
//                     ],
//                   ),
//                   //  Text('Price-\$${cartItem['price']} RS\n' 
                  
//                     // 'Total: \$${calculateTotalAmount().toStringAsFixed(2)}'),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.remove_circle),
//                         onPressed: () {
//                           setState(() {
//                             if (cartItem['quantity'] as int > 1) {
//                               cartItem['quantity'] = (cartItem['quantity'] as int) - 1;
//                             } else {
//                               cart.removeAt(index);
//                             }
//                           });
//                         },
//                       ),
//                       Text(cartItem['quantity'].toString()),
//                       IconButton(
//                         icon: const Icon(Icons.add_circle),
//                         onPressed: () {
//                           setState(() {
//                             cartItem['quantity'] = (cartItem['quantity'] as int) + 1;
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           setState(() {
//                             cart.removeAt(index);
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Text(
//           //     'Total: \$${calculateTotalAmount().toStringAsFixed(2)}',
//           //     style: const TextStyle(
//           //       fontSize: 20,
//           //       fontWeight: FontWeight.bold,
//           //     ),
//           //   ),
//           // ),
//           Row(
//             children: [
//               Material(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 255, 137, 137),
//                     foregroundColor: Colors.black,
//                   ),
//                   child: const SizedBox(
//                     height: kToolbarHeight,
//                     width: 150,
//                     child: Center(
//                       child: Text(
//                         'Back',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Material(
//                   // color: const Color(0xffff8906),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const CheckoutPage(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                     backgroundColor:const Color.fromARGB(255, 8, 8, 8),
//                     foregroundColor: Colors.white,
//                   ),
//                     child: const SizedBox(
//                       height: kToolbarHeight,
//                       width: 150,
//                       child: Center(
//                         child: Text(
//                           'Place Order',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: const Center(
//         child: Cartpage(),
//       ),
//     ),
//   ));
// }










































// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/checkoutpage.dart';
// // import 'package:shop_ecommerce/product_detail.dart';

// List<Map<String, Object>> cart = [];

// void addToCart(Map<String, Object> product) {
//   cart.add(product);
// }

// class Cartpage extends StatefulWidget {
//   const Cartpage({super.key});

//   @override
//   State<Cartpage> createState() => _CartpageState();
// }

// class _CartpageState extends State<Cartpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cart Page"),
//         actions: const [Icon(Icons.shopping_cart)],
//       ),
//       body: ListView.builder(
//         itemCount: cart.length,
//         itemBuilder: (context, index) {
//           final cartItem = cart[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage(cartItem['image'] as String),
//             ),

//             trailing: Column(
//               children: [
//                 IconButton(
//                   icon: const Icon(
//                     Icons.delete,
//                     color: Colors.red,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       cart.removeAt(index);
//                     });
//                   },
//                 ),
                
//               ],
//             ),

//             title: Text(cartItem['title'] as String),
//             subtitle: Text('\$${cartItem['price']}'),
//           );
//         },
//       ),
//       bottomNavigationBar: Row(
//         children: [
//           Material(
//             // color: const Color.fromARGB(255, 255, 137, 137),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 255, 137, 137),
//                 foregroundColor: Colors.black,
//               ),
//               child: const SizedBox(
//                 height: kToolbarHeight,
//                 width: 150,
//                 child: Center(
//                   child: Text(
//                     'Back',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Material(
//               color: const Color(0xffff8906),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const CheckoutPage(),
//                     ),
//                   );
//                 },
//                 child: const SizedBox(
//                   height: kToolbarHeight,
//                   // width: double.infinity,
//                   width: 150,
//                   child: Center(
//                     child: Text(
//                       'Place Order',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


















