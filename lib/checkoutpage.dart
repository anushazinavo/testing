



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math';
// import 'package:shop_ecommerce/main.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CODProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class CheckoutPages extends StatelessWidget {
//   const CheckoutPages({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CheckoutPages(),
//     );
//   }
// }

// void _sendOTP(BuildContext context, String email) {
//   final Random random = Random();
//   final int otp = 1000 + random.nextInt(9000);
//   _showOTPDialog(
//     context,
//     otp,
//   );
//   print('Sending OTP $otp to $email');
// }

// void _showOTPDialog(BuildContext context, int otp) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('OTP Generated'),
//       content: Text('Your OTP is: $otp'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           // onPressed: (){},
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// void _showOrderPlacedDialog(BuildContext context, String email) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Order Placed'),
//       content: const Column(
//         children: [
//           Text(
//               'Your order has been placed successfully with Cash on Delivery '),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             _sendOTP(context, email);
//             // Navigator.of(context).pop();
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const MyApp()),
//             );
//           },
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// void _showSelectPaymentMethodDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Select Payment Method'),
//       content: const Text('Please select a payment method to proceed.'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// class CODProvider with ChangeNotifier {
//   bool _isCODSelected = false;

//   bool get isCODSelected => _isCODSelected;

//   void selectCOD() {
//     _isCODSelected = true;
//     notifyListeners();
//   }

//   void unselectCOD() {
//     _isCODSelected = false;
//     notifyListeners();
//   }
// }

// class CheckoutPage extends StatefulWidget {
//   final List<Map<String, Object>> cart;
//   final double totalAmount;
//   final double subTotal;

//   const CheckoutPage({
//     super.key,
//     required this.cart,
//     required this.totalAmount,
//     required this.subTotal,
//   });

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   final border = OutlineInputBorder(
//     borderSide: const BorderSide(
//       width: 1.0,
//       style: BorderStyle.solid,
//       color: Colors.grey,
//     ),
//     borderRadius: BorderRadius.circular(5),
//   );

//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               _buildAddressSection('Billing Address'),
//               _buildAddressSection('Shipping Address'),
//               _buildPaymentMethodsSection(),
//               _buildCODSection(),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   final codProvider =
//                       Provider.of<CODProvider>(context, listen: false);
//                   if (codProvider.isCODSelected) {
//                     _showOrderPlacedDialog(context, _emailController.text);
//                   } else {
//                     _showSelectPaymentMethodDialog(context);
//                   }
//                 },
//                 child: const Text('Place Order'),
//               ),
//               const SizedBox(height: 20),
//               _buildOrderSummary(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAddressSection(String title) {
//     return ExpansionTile(
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       children: [
//         _buildTextField('Enter your Name', Icons.person),
//         _buildTextField('Enter your Address', Icons.location_city),
//         _buildTextField('Enter your Email', Icons.email,
//             controller: _emailController),
//         _buildTextField('Enter your Phone Number', Icons.phone),
//       ],
//     );
//   }

//   Widget _buildTextField(String hintText, IconData icon,
//       {TextEditingController? controller}) {
//     return ListTile(
//       title: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           focusedBorder: border,
//           enabledBorder: border,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black),
//           prefixIcon: Icon(icon),
//           iconColor: Colors.grey,
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentMethodsSection() {
//     return ExpansionTile(
//       title: const Text(
//         'Payment Methods',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       children: [
//         _buildPaymentMethodTile(Icons.paypal, 'PayPal'),
//         _buildPaymentMethodTile(Icons.credit_card, 'Credit Card'),
//       ],
//     );
//   }

//   Widget _buildPaymentMethodTile(IconData icon, String title) {
//     return ExpansionTile(
//       leading: Icon(icon),
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       children: [
//         ListTile(
//           leading: Icon(icon),
//           title: Text('$title Method'),
//         ),
//       ],
//     );
//   }

//   Widget _buildOrderSummary() {
//     return Column(
//       children: [
//         _buildSummaryRow('Subtotal:', '${widget.subTotal.toStringAsFixed(2)}rs'),
//         const SizedBox(height: 5),
//         _buildSummaryRow('Discount:', '10%'),
//         const SizedBox(height: 5),
//         _buildSummaryRow('Total:', '${widget.totalAmount.toStringAsFixed(2)}rs'),
//         const SizedBox(height: 5),
//         _buildConfirmationMessage(),
//       ],
//     );
//   }

//   Widget _buildSummaryRow(String title, String value) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             Text(value),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConfirmationMessage() {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Text(
//               'Order Confirmed',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCODSection() {
//     return ExpansionTile(
//       title: const Text(
//         'Cash on Delivery',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       leading: Consumer<CODProvider>(
//         builder: (context, codProvider, child) {
//           return Radio<bool>(
//             value: true,
//             groupValue: codProvider.isCODSelected,
//             onChanged: (value) {
//               if (value != null && value) {
//                 codProvider.selectCOD();
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }















































// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // void main() {
// //   runApp(
// //     ChangeNotifierProvider(
// //       create: (context) => CODProvider(),
// //       child: const MyApp(),
// //     ),
// //   );
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: const CheckoutPage(),
// //     );
// //   }
// // }

// void _showOrderPlacedDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Order Placed'),
//       content: const Text('Your order has been placed successfully with Cash on Delivery.'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// void _showSelectPaymentMethodDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Select Payment Method'),
//       content: const Text('Please select a payment method to proceed.'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// class CODProvider with ChangeNotifier {
//   bool _isCODSelected = false;

//   bool get isCODSelected => _isCODSelected;

//   void selectCOD() {
//     _isCODSelected = true;
//     notifyListeners();
//   }

//   void unselectCOD() {
//     _isCODSelected = false;
//     notifyListeners();
//   }
// }

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({super.key});

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   final border = OutlineInputBorder(
//     borderSide: const BorderSide(
//       width: 1.0,
//       style: BorderStyle.solid,
//       color: Colors.grey,
//     ),
//     borderRadius: BorderRadius.circular(5),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               _buildAddressSection('Billing Address'),
//               _buildAddressSection('Shipping Address'),
//               _buildPaymentMethodsSection(),
//               _buildCODSection(),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   final codProvider = Provider.of<CODProvider>(context, listen: false);
//                   if (codProvider.isCODSelected) {
//                     _showOrderPlacedDialog(context);
//                   } else {
//                     _showSelectPaymentMethodDialog(context);
//                   }
//                 },
//                 child: const Text('Place Order'),
//               ),
//               const SizedBox(height: 20),
//               _buildOrderSummary(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAddressSection(String title) {
//     return ExpansionTile(
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       children: [
//         _buildTextField('Enter your Name', Icons.person),
//         _buildTextField('Enter your Address', Icons.location_city),
//         _buildTextField('Enter your Email', Icons.email),
//         _buildTextField('Enter your Phone Number', Icons.phone),
//       ],
//     );
//   }

//   Widget _buildTextField(String hintText, IconData icon) {
//     return ListTile(
//       title: TextField(
//         decoration: InputDecoration(
//           focusedBorder: border,
//           enabledBorder: border,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black),
//           prefixIcon: Icon(icon),
//           iconColor: Colors.grey,
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentMethodsSection() {
//     return ExpansionTile(
//       title: const Text(
//         'Payment Methods',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       children: [
//         _buildPaymentMethodTile(Icons.paypal, 'PayPal'),
//         _buildPaymentMethodTile(Icons.credit_card, 'Credit Card'),
//       ],
//     );
//   }

//   Widget _buildPaymentMethodTile(IconData icon, String title) {
//     return ExpansionTile(
//       leading: Icon(icon),
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       children: [
//         ListTile(
//           leading: Icon(icon),
//           title: Text('$title Method'),
//         ),
//       ],
//     );
//   }

//   Widget _buildCODSection() {
//     return ExpansionTile(
//       title: const Text(
//         'Cash on Delivery',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w900,
//         ),
//       ),
//       leading: Consumer<CODProvider>(
//         builder: (context, codProvider, child) {
//           return Radio<bool>(
//             value: true,
//             groupValue: codProvider.isCODSelected,
//             onChanged: (value) {
//               if (value != null && value) {
//                 codProvider.selectCOD();
//               }
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildOrderSummary() {
//     return Column(
//       children: [
//         _buildSummaryRow('Subtotal:', '435rs'),
//         const SizedBox(height: 5),
//         _buildSummaryRow('Discount:', '10%'),
//         const SizedBox(height: 5),
//         _buildSummaryRow('Total:', '391.5rs'),
//         const SizedBox(height: 5),
//         _buildConfirmationMessage(),
//       ],
//     );
//   }

//   Widget _buildSummaryRow(String title, String value) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             Text(value),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConfirmationMessage() {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Text(
//               'Order Confirmed',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // class RadioExampleApp extends StatelessWidget {
// //   const RadioExampleApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: const Text('Radio Sample')),
// //         body: const Center(
// //           child: RadioExample(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // enum SingingCharacter { lafayette, jefferson }

// // class RadioExample extends StatefulWidget {
// //   const RadioExample({super.key});

// //   @override
// //   State<RadioExample> createState() => _RadioExampleState();
// // }

// // class _RadioExampleState extends State<RadioExample> {
// //   SingingCharacter? _character = SingingCharacter.lafayette;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: <Widget>[
// //         ListTile(
// //           title: const Text('Lafayette'),
// //           leading: Radio<SingingCharacter>(
// //             value: SingingCharacter.lafayette,
// //             groupValue: _character,
// //             onChanged: (SingingCharacter? value) {
// //               setState(() {
// //                 _character = value;
// //               });
// //             },
// //           ),
// //         ),
// //         ListTile(
// //           title: const Text('Thomas Jefferson'),
// //           leading: Radio<SingingCharacter>(
// //             value: SingingCharacter.jefferson,
// //             groupValue: _character,
// //             onChanged: (SingingCharacter? value) {
// //               setState(() {
// //                 _character = value;
// //               });
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // void _showOrderPlacedDialog(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (context) => AlertDialog(
// //       title: const Text('Order Placed'),
// //       content: const Text(
// //           'Your order has been placed successfully with Cash on Delivery.'),
// //       actions: [
// //         TextButton(
// //           onPressed: () => Navigator.of(context).pop(),
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // void _showSelectPaymentMethodDialog(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (context) => AlertDialog(
// //       title: const Text('Select Payment Method'),
// //       content: const Text('Please select a payment method to proceed.'),
// //       actions: [
// //         TextButton(
// //           onPressed: () => Navigator.of(context).pop(),
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }









// //  we are mentioned the leading 
// //to the RenderBox was not laid out error. 
// //To fix this, you can wrap the IndexedStack in an
// // Expanded widget to ensure it takes up the remaining 
// //available space within the Column.











// // import 'package:flutter/material.dart';

// // class CheckoutPage extends StatefulWidget {
// //   final List<Map<String, Object>> cart;

// //   const CheckoutPage({super.key, required this.cart});

// //   @override
// //   State<CheckoutPage> createState() => _CheckoutPageState();
// // }

// // class _CheckoutPageState extends State<CheckoutPage> {
// //   double calculateTotalAmount() {
// //     double total = 0;
// //     for (var item in widget.cart) {
// //       total += (item['price'] as double) * (item['quantity'] as int);
// //     }
// //     return total;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Checkout Page'),
// //         actions: const [
// //           Padding(
// //             padding: EdgeInsets.all(8.0),
// //             child: Icon(Icons.shopping_cart),
// //           )
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: widget.cart.length,
// //               itemBuilder: (context, index) {
// //                 final cartItem = widget.cart[index];
// //                 return ListTile(
// //                   leading: CircleAvatar(
// //                     backgroundImage: AssetImage(cartItem['image'] as String),
// //                   ),
// //                   title: Text(cartItem['title'] as String),
// //                   subtitle: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text('Price: \$${cartItem['price']}'),
// //                       Text(
// //                         'Quantity: ${cartItem['quantity']}',
// //                         style: const TextStyle(
// //                           fontSize: 15,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   trailing: Text(
// //                     'Total: \$${(cartItem['price'] as double * cartItem['quantity'] as int).toStringAsFixed(2)}',
// //                     style: const TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   'Subtotal: \$${calculateTotalAmount().toStringAsFixed(2)}',
// //                   style: const TextStyle(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.w900,
// //                   ),
// //                 ),
// //                 Row(
// //                   children: [
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         Navigator.pop(context);
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color.fromARGB(255, 255, 137, 137),
// //                         foregroundColor: Colors.black,
// //                       ),
// //                       child: const Text(
// //                         'Back',
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         // Implement order placing functionality here
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color.fromARGB(255, 8, 8, 8),
// //                         foregroundColor: Colors.white,
// //                       ),
// //                       child: const Text(
// //                         'Place Order',
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }