// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/buttons.dart';
// // import 'package:shop_ecommerce/textfields.dart';

// import 'package:shop_ecommerce/log.dart';

// import 'package:shop_ecommerce/log2.dart';
// void main() {
//    WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// // Main Application
// class MyApp extends StatelessWidget {
  
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      
//       home: const AuthScreen(),
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/signup': (context) => const SignupScreen(),
//       },
//     );
//   }
// }

// // AuthScreen
// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Login and Signup",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Button(
//                   label: "LOGIN",
//                   press: () {
//                     Navigator.pushNamed(context, '/login');
//                   },
//                 ),
//                 Button(
//                   label: "SIGN UP",
//                   press: () {
//                     Navigator.pushNamed(context, '/signup');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'cod_provider.dart';
// import './dcheckoutpage.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CODProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'COD Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CheckoutPage(),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shop_ecommerce/cart_provider.dart';
import 'package:shop_ecommerce/product_list.dart';
import 'package:shop_ecommerce/cart.dart';
import 'package:shop_ecommerce/wishlist.dart';
import 'package:shop_ecommerce/auth.dart';
import 'package:shop_ecommerce/dcheckoutpage.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color.fromRGBO(224, 41, 215, 1),
        ledColor: const Color.fromRGBO(224, 41, 215, 1),
        importance: NotificationImportance.High,
        channelShowBadge: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
      ),
    ],
    debug: true,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CODProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentpage = 0;

  final List<Widget> pages = const [
    ProductListPage(),
    Cartpage(),
    WishlistPage(),
    NotificationApp(),
    CheckoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black45),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black45),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black45),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black45),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment, color: Colors.black45),
            label: 'Checkout',
          ),
        ],
        currentIndex: currentpage,
        selectedItemColor: Colors.amber[800],
      ),
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
    );
  }
}


