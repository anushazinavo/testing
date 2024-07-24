import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('User Profile Page'),
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/buttons.dart';
// // import 'package:shop_ecommerce/textfields.dart';
// import 'package:shop_ecommerce/Json/json_data.dart';
// import 'package:shop_ecommerce/log.dart';


// // import 'package:shop_ecommerce/log2.dart';
// class Profile extends StatelessWidget {
//   final Users? profile;
//   const Profile({super.key, this.profile});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 45.0,horizontal: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.blue,
//                 radius: 77,
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage("assets/no_user.jpg"),
//                   radius: 75,
//                 ),
//               ),

//               const SizedBox(height: 10),
//               Text(profile!.fullName??"",style: const TextStyle(fontSize: 28,color: Colors.blue),),
//               Text(profile!.email??"",style: const TextStyle(fontSize: 17,color: Colors.grey),),

//               Button(label: "SIGN UP", press: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
//               }),

//                 ListTile(
//                 leading: const Icon(Icons.person,size: 30),
//                 subtitle: const Text("Full name"),
//                 // print('subtitlt')
//                 title: Text(profile!.fullName??""),
//               ),

//                ListTile(
//                 leading: const Icon(Icons.email,size: 30),
//                 subtitle: const Text("Email"),
//                 title: Text(profile!.email??""),
//               ),

//               // ListTile(
//               //   leading: const Icon(Icons.account_circle,size: 30),
//               //   subtitle: Text(profile!.usrName),
//               //   title: const Text("admin"),
//               // ),
//           ],
//         ),
//             )),
//       ),
//     );
//   }
// }






// // import 'package:flutter/material.dart';
// // import 'package:shop_ecommerce/buttons.dart';
// // import 'package:shop_ecommerce/textfields.dart';

// // import 'package:path/path.dart';
// // import 'package:sqflite/sqflite.dart';

// // import 'package:shop_ecommerce/Json/json_data.dart';

// // class DatabaseHelper{
// //   final databaseName = "auth.db";

// //   //Tables

// //   //Don't put a comma at the end of a column in sqlite

// //   String user = '''
// //    CREATE TABLE users (
// //    usrId INTEGER PRIMARY KEY AUTOINCREMENT,
// //    fullName TEXT,
// //    email TEXT,
// //    usrName TEXT UNIQUE,
// //    usrPassword TEXT
// //    )
// //    ''';

// //   //Our connection is ready
// //   Future<Database> initDB ()async{
// //     final databasePath = await getDatabasesPath();
// //     final path = join(databasePath, databaseName);

// //     return openDatabase(path,version: 1 , onCreate: (db,version)async{
// //       await db.execute(user);
// //     });
// //   }

// //   //Function methods

// //   //Authentication
// //   Future<bool> authenticate(Users usr)async{
// //     final Database db = await initDB();
// //     var result = await db.rawQuery("select * from users where usrName = '${usr.usrName}' AND usrPassword = '${usr.password}' ");
// //     if(result.isNotEmpty){
// //       return true;
// //     }else{
// //       return false;
// //     }
// //   }

// //   //Sign up
// //   Future<int> createUser(Users usr)async{
// //     final Database db = await initDB();
// //     return db.insert("users", usr.toMap());
// //   }


// //   //Get current User details
// //   Future<Users?> getUser(String usrName)async{
// //     final Database db = await initDB();
// //     var res = await db.query("users",where: "usrName = ?", whereArgs: [usrName]);
// //     return res.isNotEmpty? Users.fromMap(res.first):null;
// //   }




// // }