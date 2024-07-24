// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'cod_provider.dart';

// class CheckoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Checkout')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Dummy order details
//             Text('Order Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text('Item 1: \$50.00'),
//             Text('Item 2: \$30.00'),
//             SizedBox(height: 20),
//             Text('Select Payment Method:', style: TextStyle(fontSize: 18)),
//             ListTile(
//               title: Text('Cash on Delivery'),
//               leading: Consumer<CODProvider>(
//                 builder: (context, codProvider, child) {
//                   return Radio<bool>(
//                     value: true,
//                     groupValue: codProvider.isCODSelected,
//                     onChanged: (value) {
//                       if (value != null && value) {
//                         codProvider.selectCOD();
//                       }
//                     },
//                   );
//                 },
//               ),
//             ),
//             // Add other payment methods here if needed
//             Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   final codProvider = Provider.of<CODProvider>(context, listen: false);
//                   if (codProvider.isCODSelected) {
//                     _showOrderPlacedDialog(context);
//                   } else {
//                     _showSelectPaymentMethodDialog(context);
//                   }
//                 },
//                 child: Text('Place Order'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showOrderPlacedDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Order Placed'),
//         content: Text('Your order has been placed successfully with Cash on Delivery.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showSelectPaymentMethodDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Select Payment Method'),
//         content: Text('Please select a payment method to proceed.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
