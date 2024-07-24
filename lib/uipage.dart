import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_ecommerce/profile.dart';
import 'package:shop_ecommerce/product_list.dart';

import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',

  //  Column(
  //   children: [
  // Image.asset('assets/images/pexels-dana-tentis-118658-262959.jpg');
  //   Image.asset('assets/images/pexels-dana-tentis-118658-262959.jpg');
  //     Image.asset('assets/images/pexels-dana-tentis-118658-262959.jpg');
  //       Image.asset('assets/images/pexels-dana-tentis-118658-262959.jpg');
  //         Image.asset('assets/images/pexels-dana-tentis-118658-262959.jpg');
  //   ],
  //  )
];

void main() => runApp(DesignPages());
final themeMode = ValueNotifier(2);

// class MainDesign extends StatelessWidget {
//   const MainDesign({super.key});

//   @override
//   Widget build(BuildContext context) {
//         return ValueListenableBuilder(
//       builder: (context, value, g) {
//     return MaterialApp(
//       initialRoute: '/',
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.values.toList()[value as int],
//       debugShowCheckedModeBanner: false,
//       home: DesignPages(),
//       routes: {
//         '/myapp': (context) => const MainDesign(),
//         '/about': (context) => const ProfilePage(),
//         '/contact': (context) => const ProductListPage(),
//         '/image': (ctx) => ImageSliderDemo(),
//       },
//     );
//       },);
//   }
// }
class MainDesign extends StatelessWidget {
  const MainDesign({super.key});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> themeModeNotifier = ValueNotifier<int>(0);
    return ValueListenableBuilder<int>(
      valueListenable: themeModeNotifier,
      builder: (context, value, _) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values[value],
          debugShowCheckedModeBanner: false,
          home: DesignPages(),
          routes: {
            '/myapp': (context) => const MainDesign(),
            '/about': (context) => const ProfilePage(),
            '/contact': (context) => const ProductListPage(),
            // '/image': (ctx) => ImageSliderDemo(),
          },
        );
      },
    );
  }
}

class DesignPages extends StatefulWidget {
  @override
  _DesignPagesState createState() => _DesignPagesState();
}

class _DesignPagesState extends State<DesignPages> {
  int currentpage = 0;
  final bluecolor = const Color.fromARGB(255, 5, 125, 238);
  final whitecolor = const Color.fromARGB(255, 255, 255, 255);
  final blackcolors = const Color.fromARGB(255, 0, 0, 0);
  final smallmenusize =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  final circleavatar = const CircleAvatar(
    radius: 80,
    backgroundImage:
        AssetImage('assets/images/pexels-dana-tentis-118658-262959.jpg'),
  );

  // bottom navigation
  final bottomnavigationbar = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.white),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart, color: Colors.white),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite, color: Colors.white),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications, color: Colors.white),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.payment, color: Colors.white),
      label: 'Checkout',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // // initialRoute: '/',
      // // darkTheme: ThemeData.dark(),
      // // themeMode: ThemeMode.values.toList()[value as int],
      // debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentpage = value;
            });
          },
          items: bottomnavigationbar,
          currentIndex: currentpage,
          selectedItemColor: Colors.amber[800],
          backgroundColor: bluecolor,
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 94, 0),
          title: Text(
            'Restaurent',
            style: TextStyle(color: whitecolor),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search, color: whitecolor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart, color: whitecolor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite, color: whitecolor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: whitecolor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: bluecolor,
                ),
                child: circleavatar,
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'Home',
                  style: smallmenusize,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainDesign()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  'About Us',
                  style: smallmenusize,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  'Contact us',
                  style: smallmenusize,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
              ListTile(
                leading: const Icon(Icons.room_service),
                title: Text(
                  'Services',
                  style: smallmenusize,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: Text(
                  'Projects',
                  style: smallmenusize,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/pexels-dana-tentis-118658-691114.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  'FOOD ITEMS',
                  style: smallmenusize,
                ),
                CarouselSlider(
                  options: CarouselOptions(),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                                child: Image.network(item,
                                    fit: BoxFit.cover, width: 1000)),
                          ))
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delicious Items',
                    style: smallmenusize,
                  ),
                  const Icon(Icons.format_line_spacing),
                ],
              ),
            ),

            // SizedBox(height: 30,),
            GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
                return Container(
                  color: whitecolor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/pexels-dzeninalukac-1583884.jpg',
                          fit: BoxFit.cover,
                          // height: 0,
                          width: 120,
                        ),
                      ),
                      Text(
                        'Shoppings',
                        style: TextStyle(
                            color: blackcolors,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'RS:20',
                          style: TextStyle(
                              color: blackcolors,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      // Align(
                      //   alignment: Alignment.,

                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40.0,
                              height: 30.0,
                              child: FloatingActionButton(
                                backgroundColor: whitecolor,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.search,
                                  size: 20.0,
                                  color: Color.fromARGB(255, 255, 94, 0),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: FloatingActionButton(
                                backgroundColor: whitecolor,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.favorite,
                                  size: 20.0,
                                  color: Color.fromARGB(255, 255, 94, 0),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                              height: 30.0,
                              child: FloatingActionButton(
                                backgroundColor: whitecolor,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.add,
                                  size: 20.0,
                                  color: Color.fromARGB(255, 255, 94, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Text(
                        'TRENDING ITEMS',
                        style: TextStyle(
                            color: whitecolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/images/pexels-robinstickel-70497.jpg',
                            fit: BoxFit.cover,
                            height: 200,
                            width: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Text(
                        'FASHION NEW ARRIVALS',
                        style: TextStyle(
                            color: whitecolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/images/pexels-enginakyurt-1437267.jpg',
                            // fit: BoxFit.cover,
                            height: 200,
                            width: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Text(
                        'FOOD NEW ARRIVALS',
                        style: TextStyle(
                            color: whitecolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/images/pexels-robinstickel-70497.jpg',
                            // fit: BoxFit.cover,
                            height: 200,
                            width: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: CarouselSlider(
                  //     options: CarouselOptions(),
                  //     items: imgList
                  //         .map((item) => Container(
                  //               child: Center(
                  //                   child: Image.network(item,
                  //                       fit: BoxFit.cover, width: 1000)),
                  //             ))
                  //         .toList(),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class ImageSliderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Image slider demo')),
//       body: Container(
//         child: CarouselSlider(
//           options: CarouselOptions(),
//           items: imgList
//               .map((item) => Container(
//                     child: Center(
//                         child: Image.network(item,
//                             fit: BoxFit.cover, width: 1000)),
//                   ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(const MainDesign());
