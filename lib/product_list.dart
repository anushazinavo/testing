import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:shop_ecommerce/product_card.dart';
import 'package:shop_ecommerce/product_detail.dart';
// import 'package:shop_ecommerce/auth.dart';
// import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:shop_ecommerce/cart.dart';
// import 'package:shop_ecommerce/wishlist.dart';
// import 'package:shop_ecommerce/profile.dart';
List<Map<String, Object>> cart = [];
void addToCart(Map<String, Object> product) {
  cart.add(product);
}
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});
  @override
  _ProductListPageState createState() => _ProductListPageState();
}
class _ProductListPageState extends State<ProductListPage> {
  final List<String> brands = [
    'All',
    'Lakme',
    'Loreal',
    'Nykaa',
    'Lotus',
    'Unilever'
  ];
  late String selectedFilter;
  String hoveredBrand = '';

  final List<Map<String, Object>> products = [
    {
      'id': 0,
      'title': 'Face Cream Products',
      'price': 40.00,
      'image': 'assets/images/cards-1.jpeg',
      'company': 'Lakme',
      // 'sizes': [5, 6, 7, 8, 9, 10, 11],
    },
    {
      'id': 1,
      'title': 'Face Wash Products',
      'price': 400.00,
      'image': 'assets/images/carousel-1.jpeg',
      'company': 'Loreal',
      // 'sizes': [5, 6, 7, 8, 9, 11],
    },
    {
      'id': 2,
      'title': 'Beauty Cream Products',
      'price': 500.00,
      'image': 'assets/images/carousel-2.jpeg',
      'company': 'Nykaa',
      // 'sizes': [7, 8, 9, 11],
    },
    {
      'id': 3,
      'title': 'Beauty Fashel Products',
      'price': 300.00,
      'image': 'assets/images/carousel-1.jpeg',
      'company': 'Lotus',
      // 'sizes': [5, 7, 8, 11],
    },
    {
      'id': 4,
      'title': 'cream products',
      'price': 200.32,
      'image': 'assets/images/cards-1.jpeg',
      'company': 'Unilever',
      // 'sizes': [5, 8, 9, 11],
    },
    {
      'id': 5,
      'title': 'Beauty Products',
      'price': 509.00,
      'image': 'assets/images/carousel-1.jpeg',
      'company': 'fair and lovely',
      // 'sizes': [5, 7, 8, 11],
    },
    {
      'id': 6,
      'title': 'Beauty Products',
      'price': 509.00,
      'image': 'assets/images/carousel-2.jpeg',
      'company': 'fair and lovely',
      // 'sizes': [5, 7, 8, 9, 11],
    }
  ];

  // int currentpage = 0;
  int currentpage = 0;
  int counter = 0;
  List<Map<String, Object>> cart = [];

  @override
  void initState() {
    super.initState();
    selectedFilter = brands[0];
    _checkNotificationPermission();
  }
  Future<void> _checkNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // selectedFilter = brands[0];
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
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite),
                  ),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        },
                      ),
                      counter != 0
                          ? Positioned(
                              right: 11,
                              top: 11,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 14,
                                  minHeight: 14,
                                ),
                                child: Text(
                                  '$counter',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const Homepage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const Cartpage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const Settings()));
              },
            ),
          ],
        ),
      ),
      body:
          // Column(
          // children: [
          //               Expanded(
          //       child: IndexedStack(
          //         index: currentpage,
          //         children: pageses,
          //       ),
          //     ),
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      // "Shoes\nCollection",
                      "Beauty\n Products",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2.0,
                            style: BorderStyle.solid,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2.0,
                            style: BorderStyle.solid,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.search),
                        iconColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  final brand = brands[index];
                  return MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        hoveredBrand = brand;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        hoveredBrand = '';
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = brand;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Chip(
                          label: Text(brand),
                          backgroundColor: selectedFilter == brand
                              ? const Color.fromARGB(255, 250, 151, 3)
                              : (hoveredBrand == brand
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : Colors.grey[100]),
                          labelStyle: TextStyle(
                            color: selectedFilter == brand
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                // scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product)));
                    },
                    child: ProductCards(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['image'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromARGB(255, 209, 176, 128)
                          : const Color.fromARGB(255, 159, 191, 219),
                      product: product,
                    ),
                  );
                },
              ),
            ),
          //   Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // children: [
            // ElevatedButton(
            //   onPressed: () => triggerNotification('morning update',
            //       'Good morning sir,\n today I will do push notification.'),
            //   child: const Text('Notification Button'),
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                onPressed: () => triggerNotification(
                    'zinavo pvt limited', 'web development company'),
                child:const Icon(Icons.notifications),
              ),
            ),
        //   ],
        // ),
          ],
        ),
      ),
      //   ],
      // ),
    );
  }
}
