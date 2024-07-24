// import 'package:flutter/material.dart';

// // import 'package:flutter/widgets.dart';
// // // import 'package:flutter/widgets.dart';
// void main() {
//   runApp(const Signup());
// }

// class Signup extends StatelessWidget {
//   const Signup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           title: const Center(
//             child: Text(
//               "Signup",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         body:
//             // Padding(
//             // padding:const EdgeInsets.all(10),

//             Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 "Create Account",
//                 style: TextStyle(
//                   color: Colors.deepOrange,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               Form(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                             hintText: "Enter your Name",
//                             hintStyle: const TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w600),
//                             prefixIcon: const Icon(Icons.person),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.deepOrange,
//                                 width: 2,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.blueAccent,
//                                 width: 2,
//                               ),
//                             )),
//                         onChanged: (value) {},
//                         // validator: (value) {
//                         //   return value!.isEmpty ? "Please enter email" : null;
//                         // },
//                       ),
//                       const SizedBox(height: 30),

//                       TextFormField(
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                             hintText: "Enter your Email",
//                             hintStyle: const TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w600),
//                             prefixIcon: const Icon(Icons.email),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.deepOrange,
//                                 width: 2,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.blueAccent,
//                                 width: 2,
//                               ),
//                             )),
//                         onChanged: (value) {},
//                         // validator: (value) {
//                         //   return value!.isEmpty ? "Please enter email" : null;
//                         // },
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         keyboardType: TextInputType.visiblePassword,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             hintText: "Enter your password",
//                             hintStyle: const TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w600),
//                             prefixIcon: const Icon(Icons.password),
//                             suffixIcon: const Icon(
//                               Icons.remove_red_eye,
//                               color: Colors.grey,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.deepOrange,
//                                 width: 2,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.blueAccent,
//                                 width: 2,
//                               ),
//                             )),
//                         onChanged: (value) {},
//                         // validator: (value) {
//                         //   return value!.isEmpty ? "Please enter email" : null;
//                         // },
//                       ),
//                       // SizedBox(height: 30),

//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 110, vertical: 20),
//                         child: MaterialButton(
//                           minWidth: double.infinity,
//                           onPressed: () {
//                             print("signup");
//                             // if (Form.of(context)!.validate()) {
//                             //   print('Logging in...');
//                             // }
//                           },
//                           child: const Text("SIGNUP "),
//                           color: Colors.deepPurple,
//                           textColor: Colors.white,
//                           focusColor: Colors.black,
//                         ),
//                       ),
//                       // ElevatedButton(
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //           builder: (context) =>const MyHomePage()),
//                       //     );
//                       //   },
//                       //   child: const Text("login page"),
//                       // )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
