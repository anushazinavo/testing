import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

// import 'package:shop_ecommerce/main.dart';
void main() {
  AwesomeNotifications().initialize(
    null,
    [
  NotificationChannel(
    channelKey: 'basic_channel',
    channelName: 'Basic notifications',
    channelDescription: 'Notification channel for basic tests',
  ),
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
  runApp(const NotificationApp());
}

class NotificationApp extends StatefulWidget {
  const NotificationApp({super.key});

  @override
  State<NotificationApp> createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Notification',
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  final String title;

  const NotificationPage({super.key, this.title = 'Notification Home'});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }
  Future<void> _checkNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }


  // Future<void> _showSnackBar(
  //     BuildContext context, String title, String body) async {
  //   final snackBar = SnackBar(
  //     backgroundColor:Colors.indigo ,
  //     content: Text('$title: $body',
  //         style: const TextStyle(
  //           fontSize: 20,
  //           color: Colors.white,
  //           // backgroundColor: Colors.indigo,
  //         )),
  //     behavior: SnackBarBehavior.floating,
  //     dismissDirection: DismissDirection.up,
  //     duration: const Duration(seconds: 3),
  //     margin: EdgeInsets.only(
  //         bottom: MediaQuery.of(context).size.height - 150,
  //         left: 10,
  //         right: 10),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  Future<void> _showPermissionDialog(
      BuildContext context, String title, String body) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to allow notifications?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Don\'t Allow'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Allow'),
              onPressed: () {
                Navigator.of(context).pop();
                // _showSnackBar(context, title, body);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> triggerNotification(String title, String body) async {
    setState(() {
      counter++;
    });

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: counter,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        bigPicture:
            'https://www.zinavo.com/wp-content/uploads/2024/07/Zinavo_logo_trans-1536x307-1.png',
        largeIcon:
            'https://www.zinavo.com/wp-content/uploads/2024/07/Zinavo_logo_trans-1536x307-1.png',
        notificationLayout: NotificationLayout.BigPicture,
      ),
      actionButtons: [
        NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
        NotificationActionButton(
          key: 'REPLY',
          label: 'Reply Message',
          requireInputText: true,
          actionType: ActionType.SilentAction,
        ),
        NotificationActionButton(
          key: 'DISMISS',
          label: 'Dismiss',
          actionType: ActionType.DismissAction,
          isDangerousOption: true,
        ),
      ],
    );

    _showPermissionDialog(context, title, body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ,
      appBar: AppBar(
        title: const Text("Notification Badge"),
        // actions: <Widget>[
        //   Stack(
        //     children: <Widget>[
        //       IconButton(
        //         icon: const Icon(Icons.notifications),
        //         onPressed: () {
        //           setState(() {
        //             counter = 0;
        //           });
        //         },
        //       ),
        //       counter != 0
        //           ? Positioned(
        //               right: 11,
        //               top: 11,
        //               child: Container(
        //                 padding: const EdgeInsets.all(2),
        //                 decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(6),
        //                 ),
        //                 constraints: const BoxConstraints(
        //                   minWidth: 14,
        //                   minHeight: 14,
        //                 ),
        //                 child: Text(
        //                   '$counter',
        //                   style: const TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 8,
        //                   ),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //             )
        //           : Container()
        //     ],
        //   ),
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => triggerNotification('morning update',
                  'Good morning sir,\n today I will do push notification.'),
              child: const Text('Notification Button'),
            ),
            ElevatedButton(
              onPressed: () => triggerNotification(
                  'zinavo pvt limited', 'web development company'),
              child: const Text('Notification Button1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 137, 137),
                foregroundColor: Colors.black,
              ),
              child: const SizedBox(
                height: kToolbarHeight,
                width: 150,
                child: Center(
                  child: Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/buttons.dart';
// // import 'package:shop_ecommerce/textfields.dart';

// import 'package:shop_ecommerce/log.dart';

// import 'package:shop_ecommerce/log2.dart';
// void main() {
//    WidgetsFlutterBinding.ensureInitialized();
//   runApp(const NotificationApp());
// }

// // Main Application
// class NotificationApp extends StatelessWidget {
  
//   const NotificationApp({super.key});

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
