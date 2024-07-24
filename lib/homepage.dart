// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/product_list.dart';
// import 'package:shop_ecommerce/cart.dart';
// import 'package:shop_ecommerce/wishlist.dart';
// import 'package:shop_ecommerce/profile.dart';


// void main() {
//   runApp(const HomePagess());
// }

// class HomePagess extends StatefulWidget {
//   const HomePagess({super.key});

//   @override
//   State<HomePagess> createState() => _HomePagessState();
// }

// class _HomePagessState extends State<HomePagess> {
//   int currentpage = 0;
//   List<Widget> pages= const [ProductListPage(), Cartpage(),WishlistPage(), ProfilePage()];
//   // int currentpage = 0;
//   // List<Map<String, Object>> cart = [];
//   // List<Widget> pages = const [
//   //   ProductListPage(),
//   //   Cartpage(),
//   //   WishlistPage(),
//   //   ProfilePage()
//   // ];

//   @override
//   void initState() {
//     super.initState();
//     // selectedFilter = brands[0];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: IndexedStack(
//           index: currentpage,
//           children:pages,
//         ),
//         // currentpage == 0 ? const ProductListPage() : const Cartpage(),    //we can get the  product list view  dispaly pages
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: (value) {
//             setState(() {
//               currentpage = value;
//             });
//           },
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.man),
//               label: '',
//             ),
//           ],
//           currentIndex: currentpage,
//           selectedItemColor: Colors.amber[800],
//           // onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
// }
