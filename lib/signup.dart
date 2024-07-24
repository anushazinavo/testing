// import 'package:flutter/material.dart';



// void main(){
//   runApp(const Loginpage());
// }
// class Loginpage extends StatelessWidget {
//   const Loginpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           title: const Center(
//             child: Text(
//               "Login Page",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Welcome Back",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             // Form(
//             //   child:
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                         // iconColor: Colors.deepPurple,
//                         // labelText: "Enter your Emails",
//                         hintText: "Enter your Emai",
//                         prefixIcon: const Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(
//                             color: Colors.deepOrange,
//                             width: 2,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(
//                             color: Colors.blueAccent,
//                             width: 2,
//                           ),
//                         )),
//                     onChanged: (value) {},
//                     // validator: (value) {
//                     //   return value!.isEmpty ? "Please enter email" : null;
//                     // },
//                   ),
//                   const SizedBox(height: 30),

//                   TextField(
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         // iconColor: Colors.deepPurple,
//                         // labelText: "Enter your Emails",
//                         hintText: "Enter your password",
//                         prefixIcon: const Icon(Icons.password),
//                         suffixIcon: const Icon(
//                           Icons.remove_red_eye,
//                           color: Colors.grey,
//                         ),

//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 2,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(
//                             color: Colors.deepOrange,
//                             width: 2,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(
//                             color: Colors.blueAccent,
//                             width: 2,
//                           ),
//                         )),
//                     onChanged: (value) {},
//                     // validator: (value) {
//                     //   return value!.isEmpty ? "Please enter email" : null;
//                     // },
//                   ),
//                   // SizedBox(height: 30),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 110, vertical: 20),
//                     child: MaterialButton(
//                       minWidth: double.infinity,
//                       onPressed: () {
//                         // if (Form.of(context)!.validate()) {
//                         //   print('Logging in...');
//                         // }
//                       },
//                       child: const Text("LOGIN"),
//                       color: Colors.deepPurple,
//                       textColor: Colors.white,
//                       focusColor: Colors.black,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             // ),
//           ],
//         ),
//       ),
//     )
//     );
//   }
// }