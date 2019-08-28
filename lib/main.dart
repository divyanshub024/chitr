import 'package:chitr/profile/ui/profile_page.dart';
import 'package:chitr/util/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'home/ui/home_page.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chitr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        accentColor: Colors.white,
      ),
      home: ChangeNotifierProvider<BottomNavBarProvider>(
        builder: (context) => BottomNavBarProvider(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final currentTab = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).backgroundColor,
      body: currentTab[provider.currentIndex],
//      bottomNavigationBar: Container(
//        decoration: BoxDecoration(
//          color: Colors.black,
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(16.0),
//            topRight: Radius.circular(16.0),
//          ),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black,
//              blurRadius: 5.0,
//            ),
//          ],
//        ),
//        child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              IconButton(
//                icon: Icon(
//                  Icons.home,
//                  color: (provider.currentIndex == 0)
//                      ? Colors.white
//                      : const Color(0xFF757575),
//                ),
//                onPressed: () {
//                  provider.currentIndex = 0;
//                },
//              ),
//              IconButton(
//                icon: Icon(
//                  Icons.person,
//                  color: (provider.currentIndex == 1)
//                      ? Colors.white
//                      : const Color(0xFF757575),
//                ),
//                onPressed: () {
//                  provider.currentIndex = 1;
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
    );
  }
}
