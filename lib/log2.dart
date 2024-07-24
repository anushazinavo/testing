// // import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/buttons.dart';
// import 'package:shop_ecommerce/textfields.dart';
// import 'package:shop_ecommerce/log.dart';


// import 'package:shop_ecommerce/sqflite/database_helper.dart';
// import 'package:shop_ecommerce/Json/json_data.dart';
// // SignupScreen
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final fullName = TextEditingController();
//   final email = TextEditingController();
//   final usrName = TextEditingController();
//   final password = TextEditingController();
//   final confirmPassword = TextEditingController();
//   final db = DatabaseHelper();
//   signUp()async{
//     var res = await db.createUser(Users(fullName: fullName.text,email: email.text,usrName: usrName.text, password: password.text));
//     print(res);
//     if(res>0){
//       if(!mounted)return;
//        Navigator.pushNamed(context, '/login');
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     "Registration",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 InputField(
//                   hint: "Full name",
//                   icon: Icons.person,
//                   controller: fullName,
                  
//                 ),
//                 InputField(
//                   hint: "Email",
//                   icon: Icons.email,
//                   controller: email,
//                 ),
//                 InputField(
//                   hint: "Username",
//                   icon: Icons.account_circle,
//                   controller: usrName,
//                 ),
//                 InputField(
//                   hint: "Password",
//                   icon: Icons.lock,
//                   controller: password,
//                   passwordInvisible: true,
//                 ),
//                 InputField(
//                   hint: "Confirm password",
//                   icon: Icons.lock,
//                   controller: confirmPassword,
//                   passwordInvisible: true,
//                 ),
//                 const SizedBox(height: 10),
//                 Button(
//                   label: "SIGN UP",
//                   press: () {
//                     print("signup page");
//                    const LoginScreen();
//                     Navigator.pushNamed(context, '/login');
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account?",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/login');
//                       },
//                       child: const Text("LOGIN"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





