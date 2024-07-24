
// import 'package:email_auth/email_auth.dart';
// // import 'package:example/auth.config.dart';
// import 'package:shop_ecommerce/auth.config.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// /// Importing the configuration file to pass them to the EmailAuth instance
// /// You can have a custom path and a variable name,
// /// but the Map should be in the pattern {server : "", serverKey : ""}
// // import 'package:email_auth_example/auth.config.dart';

// void main() {
//   const GeneratingOtp app = GeneratingOtp();
//   runApp(kDebugMode ? const GeneratingOtp() : app);
// }

// class GeneratingOtp extends StatefulWidget {
//   const GeneratingOtp({super.key});

//   @override
//   // ignore: library_private_types_in_public_apianushaanusha
//   _GeneratingOtpState createState() => _GeneratingOtpState();
// }

// class _GeneratingOtpState extends State<GeneratingOtp> {
//   /// The boolean to handle the dynamic operations
//   bool submitValid = false;

//   /// Text editing controllers to get the value from text fields
//   final TextEditingController _emailcontroller = TextEditingController();
//   final TextEditingController _otpcontroller = TextEditingController();

//   // Declare the object
//   late EmailAuth emailAuth;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the package
//     emailAuth = EmailAuth(
//       sessionName: "Sample session",
//     );

//     /// Configuring the remote server
//     emailAuth.config(remoteServerConfiguration);

//   //     if(await emailAuth.config(remoteServerConfiguration){
//   //  //Your Code.
//   //  }
//   }

//   /// a void function to verify if the Data provided is true
//   /// Convert it into a boolean function to match your needs.
//   void verify() {
//     if (kDebugMode) {
//       print(
//           "OTP validation results >> ${emailAuth.validateOtp(recipientMail: _emailcontroller.value.text, userOtp: _otpcontroller.value.text)}");
//     }
//   }

//   /// a void funtion to send the OTP to the user
//   /// Can also be converted into a Boolean function and render accordingly for providers
//   void sendOtp() async {
//     bool result = await emailAuth.sendOtp(recipientMail: _emailcontroller.value.text, otpLength: 5);
//     if (result) {
//       setState(() {
//         submitValid = true;
//       });
//     } else if (kDebugMode) {
//       print("Error processing OTP requests, check server for logs");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Email Auth sample verification'),
//         ),
//         body: Container(
//             margin: const EdgeInsets.all(5),
//             child: Center(
//               child: Card(
//                 elevation: 5,
//                 margin: const EdgeInsets.all(15),
//                 child: Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Column(
//                     children: <Widget>[
//                       const Text(
//                         "Please enter a valid Email ID",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                       TextField(
//                         controller: _emailcontroller,
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                       Card(
//                         margin: const EdgeInsets.only(top: 20),
//                         elevation: 6,
//                         child: Container(
//                           height: 50,
//                           width: 200,
//                           color: Colors.green[400],
//                           child: GestureDetector(
//                             onTap: sendOtp,
//                             child: const Center(
//                               child: Text(
//                                 "Request OTP",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       /// A dynamically rendering text field
//                       (submitValid)
//                           ? TextField(
//                               controller: _otpcontroller,
//                             )
//                           : Container(height: 1),
//                       (submitValid)
//                           ? Container(
//                               margin: const EdgeInsets.only(top: 20),
//                               height: 50,
//                               width: 200,
//                               color: Colors.green[400],
//                               child: GestureDetector(
//                                 onTap: verify,
//                                 child: const Center(
//                                   child: Text(
//                                     "Verify",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(height: 1),
//                     ],
//                   ),
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }
































import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const GeneratingOtp());
}

class GeneratingOtp extends StatelessWidget {
  const GeneratingOtp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  OTPPage(),
    );
  }
}

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _phoneController = TextEditingController();
    // final TextEditingController _emailController = TextEditingController();
  String? _generatedOTP;

  void _generateOTP() {
    final Random random = Random();
    final int otp = 1000 + random.nextInt(9000); 
    setState(() {
      _generatedOTP = otp.toString();
    });
    _showOTPDialog(otp);
  }

  void _showOTPDialog(int otp) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('OTP Generated'),
        content: Text('Your OTP is: $otp'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateOTP,
              child: const Text('Generate OTP'),
            ),
            const SizedBox(height: 20),
            if (_generatedOTP != null)
              Text(
                'Generated OTP: $_generatedOTP',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
