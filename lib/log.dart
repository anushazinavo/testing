// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/buttons.dart';
// import 'package:shop_ecommerce/textfields.dart';
// // import 'package:shop_ecommerce/log.dart';
// // import 'package:shop_ecommerce/log2.dart';
// import 'package:shop_ecommerce/sqflite/database_helper.dart';
// import 'package:shop_ecommerce/Json/json_data.dart';
// import 'package:shop_ecommerce/profile.dart';
// import 'package:shop_ecommerce/product_list.dart';
// // LoginScreen
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final usrName = TextEditingController();
//   final password = TextEditingController();

//   bool isChecked = false;
//   bool isLoginTrue = false;

//   final db = DatabaseHelper();
//   //Login Method
//   //We will take the value of text fields using controllers in order to verify whether details are correct or not
//   login()async{
//     Users? usrDetails = await db.getUser(usrName.text);
//     var res = await db.authenticate(Users(usrName: usrName.text, password: password.text));
//     if(res == true){
//       //If result is correct then go to profile or home
//       if(!mounted)return;
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(profile: usrDetails)));
//     }else{
//       //Otherwise show the error message
//       setState(() {
//         isLoginTrue = true;
//       });
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
//                 const Text(
//                   "LOGIN",
//                   style: TextStyle(color: Colors.blue, fontSize: 40),
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
//                 ListTile(
//                   horizontalTitleGap: 2,
//                   title: const Text("Remember me"),
//                   leading: Checkbox(
//                     activeColor: Colors.blue,
//                     value: isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = !isChecked;
//                       });
//                     },
//                   ),
//                 ),
//                 Button(
//                   label: "LOGIN",
//                   press: () {

//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ProductListPage()),
//                   );
                
     

//                   //  const ProductListPage();
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don't have an account?",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/signup');
//                       },
//                       child: const Text("SIGN UP"),
//                     ),
//                   ],
//                 ),
//                 isLoginTrue
//                     ? Text(
//                         "Username or password is incorrect",
//                         style: TextStyle(color: Colors.red.shade900),
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
