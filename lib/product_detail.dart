import 'package:flutter/material.dart';
import 'package:shop_ecommerce/cart.dart';
// import 'package:shop_ecommerce/cart_count.dart';
class ProductDetailPage extends StatelessWidget {
  final Map<String, Object> product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail Page"),
        actions: const [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Text(
            product['title'] as String,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          Image.asset(product['image'] as String),
          const Spacer(flex: 1),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 238, 237, 237),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$${product['price']}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // SizedBox(
                //   height: 50,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: (product['sizes'] as List<int>).length,
                //     itemBuilder: (context, index) {
                //       final size = (product['sizes'] as List<int>)[index];
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: GestureDetector(
                //           onTap: () {
                //             print("Selected size: $size");
                //           },
                //           child: Chip(
                //             label: Text(size.toString()),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      addToCart(product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Cartpage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
















// import 'package:flutter/material.dart';

// class ProductDetailPage extends StatelessWidget {
//   final Map<String, Object> product;

//   const ProductDetailPage({
//     super.key,
//     required this.product,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product Detail Page"),
//       ),
//       body: Column(
//         children: [
//           Text(
//             product['title'] as String,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 30,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//           const Spacer(),
//           Image.asset(product['image'] as String),
//           const Spacer(flex: 1),
//           Container(
//             height: 250,
//             // color: Color.fromARGB(255, 240, 237, 237),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color:const Color.fromARGB(255, 238, 237, 237),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "\$${product['price']}",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // const SizedBox(height: 10),
//                 SizedBox(
//                   height: 50,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: (product['sizes'] as List<int>).length,
//                     itemBuilder: (context, index) {
//                       final size = (product['sizes'] as List<int>)[index];
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             print(" product sizes");
//                           },
//                           child: Chip(
//                             label: Text(size.toString()),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print("button");
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     child: const Text("Add to Cart"),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
