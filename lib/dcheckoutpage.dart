// import 'package:flutter/material.dart';

// // Mock data for products (replace with your actual product data)
// List<Map<String, Object>> cart = [
//   {'id': 1, 'title': 'Product 1', 'price': 100.0, 'image': 'assets/product1.jpg', 'quantity': 2},
//   {'id': 2, 'title': 'Product 2', 'price': 200.0, 'image': 'assets/product2.jpg', 'quantity': 1},
// ];

// void main() {
//   runApp(const CheckoutPage());
// }

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({Key? key}) : super(key: key);

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   SingingCharacter? _character = SingingCharacter.cashOnDelivery;
//   final border = OutlineInputBorder(
//     borderSide: const BorderSide(
//       width: 1.0,
//       style: BorderStyle.solid,
//       color: Colors.grey,
//     ),
//     borderRadius: BorderRadius.circular(5),
//   );

//   double calculateTotalAmount() {
//     double total = 0;
//     for (var item in cart) {
//       total += (item['price'] as double) * (item['quantity'] as int);
//     }
//     return total;
//   }

//   double calculateDiscount() {
//     // Assume a flat 10% discount for simplicity
//     return calculateTotalAmount() * 0.1;
//   }

//   double calculateFinalAmount() {
//     return calculateTotalAmount() - calculateDiscount();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Checkout Page'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     ExpansionTile(
//                       title: const Text(
//                         'Billing Address',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                       children: <Widget>[
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your Name",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.person),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your address",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.location_city),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your email",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.email),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your phone number",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.phone),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     ExpansionTile(
//                       title: const Text(
//                         'Shipping Address',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                       children: <Widget>[
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your Name",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.person),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your address",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.location_city),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your email",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.email),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: TextField(
//                             decoration: InputDecoration(
//                               focusedBorder: border,
//                               enabledBorder: border,
//                               hintText: "Enter your phone number",
//                               hintStyle: const TextStyle(color: Colors.black),
//                               prefixIcon: const Icon(Icons.phone),
//                               iconColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const ExpansionTile(
//                       title: Text(
//                         'Payment methods',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                       children: <Widget>[
//                         ExpansionTile(
//                           leading: Icon(Icons.paypal),
//                           title: Text(
//                             "Paypal method",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           children: <Widget>[
//                             ListTile(
//                               leading: Icon(Icons.paypal),
//                               title: Text("Paypal"),
//                             ),
//                           ],
//                         ),
//                         ExpansionTile(
//                           leading: Icon(Icons.credit_card),
//                           title: Text(
//                             "Credit card method",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           children: <Widget>[
//                             ListTile(
//                               leading: Icon(Icons.credit_card),
//                               title: Text("Credit Card"),
//                             ),
//                           ],
//                         ),
//                         ExpansionTile(
//                           leading: Icon(Icons.money),
//                           title: Text(
//                             "Cash on Delivery",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           children: <Widget>[
//                             ListTile(
//                               leading: Icon(Icons.handshake),
//                               title: Text("Cash"),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     ListTile(
//                       title: const Text('Cash on Delivery'),
//                       leading: Radio<SingingCharacter>(
//                         value: SingingCharacter.cashOnDelivery,
//                         groupValue: _character,
//                         onChanged: (SingingCharacter? value) {
//                           setState(() {
//                             _character = value;
//                           });
//                         },
//                       ),
//                     ),
//                     ListTile(
//                       title: const Text('Paypal'),
//                       leading: Radio<SingingCharacter>(
//                         value: SingingCharacter.paypal,
//                         groupValue: _character,
//                         onChanged: (SingingCharacter? value) {
//                           setState(() {
//                             _character = value;
//                           });
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Subtotal: ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                             Text('\$${calculateTotalAmount().toStringAsFixed(2)}'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Discount: ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                             Text('\$${calculateDiscount().toStringAsFixed(2)}'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Total: ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                             Text('\$${calculateFinalAmount().toStringAsFixed(2)}'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// enum SingingCharacter { cashOnDelivery, paypal }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:shop_ecommerce/main.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CODProvider(),
//       // child: const CheckoutPages(),
//     ),
//   );
// }

// class CheckoutPages extends StatelessWidget {
//   const CheckoutPages({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CheckoutPage(),
//     );
//   }
// }
class CODProvider with ChangeNotifier {
  bool _isCODSelected = false;

  bool get isCODSelected => _isCODSelected;

  void selectCOD() {
    _isCODSelected = true;
    notifyListeners();
  }

  void unselectCOD() {
    _isCODSelected = false;
    notifyListeners();
  }
}
void _showOTPDialog(BuildContext context, int otp) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('OTP Generated'),
      content: Text('Your OTP is: $otp'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          // onPressed: (){},
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
void _sendOTP(BuildContext context, String email) {
  final Random random = Random();
  final int otp = 1000 + random.nextInt(9000);
  _showOTPDialog(
    context,
    otp,
  );
  print('Sending OTP $otp to $email');
}



void _showOrderPlacedDialog(BuildContext context, String email) {
  const String email = 'anushamuraboina6@gmail.com';
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Order Placed'),
      content: const Column(
        children: [
          Text('Your order has been placed successfully with Cash on Delivery '),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _sendOTP(context, email);
            // Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MyApp()),
            );
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

void _showSelectPaymentMethodDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Select Payment Method'),
      content: const Text('Please select a payment method to proceed.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class CheckoutPage extends StatefulWidget {
  // final List<Map<String, Object>> cart;
  // final double totalAmount;
  // final double subTotal;

  // const CheckoutPage({
  //   super.key,
  //   required this.cart,
  //   required this.totalAmount,
  //   required this.subTotal,
  // });
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // TextEditingController _emailController =TextEditingController();
  final border = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1.0,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(5),
  );

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildAddressSection('Billing Address'),
              _buildAddressSection('Shipping Address'),
              _buildPaymentMethodsSection(),
              _buildCODSection(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final codProvider =
                      Provider.of<CODProvider>(context, listen: false);
                  if (codProvider.isCODSelected) {
                    _showOrderPlacedDialog(context, _emailController.text);
                  } else {
                    _showSelectPaymentMethodDialog(context);
                  }
                }, 
                child: const Text('Place Order'),
              ),
              const SizedBox(height: 20),
              _buildOrderSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressSection(String title) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      children: [
        _buildTextField('Enter your Name', Icons.person),
        _buildTextField('Enter your Address', Icons.location_city),
        _buildTextField('Enter your Email', Icons.email, controller: _emailController),
        _buildTextField('Enter your Phone Number', Icons.phone),
      ],
    );
  }

  Widget _buildTextField(String hintText, IconData icon,
      {TextEditingController? controller}) {
    return ListTile(
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: border,
          enabledBorder: border,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(icon),
          iconColor: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPaymentMethodsSection() {
    return ExpansionTile(
      title: const Text(
        'Payment Methods',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      children: [
        _buildPaymentMethodTile(Icons.paypal, 'PayPal'),
        _buildPaymentMethodTile(Icons.credit_card, 'Credit Card'),
      ],
    );
  }

  Widget _buildPaymentMethodTile(IconData icon, String title) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text('$title Method'),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      children: [
        _buildSummaryRow('Subtotal:', '435rs'),
        const SizedBox(height: 5),
        _buildSummaryRow('Discount:', '10%'),
        const SizedBox(height: 5),
        _buildSummaryRow('Total:', '391.5rs'),
        const SizedBox(height: 5),
        _buildConfirmationMessage(),
      ],
      //       children: [
//         _buildSummaryRow('Subtotal:', '${widget.subTotal.toStringAsFixed(2)}rs'),
//         const SizedBox(height: 5),
//         _buildSummaryRow('Discount:', '10%'),
//         const SizedBox(height: 5),
//         _buildSummaryRow('Total:', '${widget.totalAmount.toStringAsFixed(2)}rs'),
//         const SizedBox(height: 5),
//         _buildConfirmationMessage(),
//       ],
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(value),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationMessage() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Order Confirmed',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCODSection() {
    return ExpansionTile(
      title: const Text(
        'Cash on Delivery',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      leading: Consumer<CODProvider>(
        builder: (context, codProvider, child) {
          return Radio<bool>(
            value: true,
            groupValue: codProvider.isCODSelected,
            onChanged: (value) {
              if (value != null && value) {
                codProvider.selectCOD();
              }
            },
          );
        },
      ),
    );
  }
}
