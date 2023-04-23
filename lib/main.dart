import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_prediction/pages/discussion.dart';
import 'package:stock_prediction/pages/home.dart';
import 'package:stock_prediction/pages/my_games.dart';
import 'package:stock_prediction/pages/profile.dart';
import 'package:stock_prediction/pages/ranks.dart';
import 'package:stock_prediction/pages/reels.dart';
import 'package:stock_prediction/pages/search.dart';
import 'package:stock_prediction/utils/token_helper.dart';
import 'auth_pages/welcome_page.dart';
import 'color_helper/defaultColor.dart';
import 'dialgo_boxs/predictDialogBox.dart';
import 'package:firebase_auth/firebase_auth.dart';

// AWS URL -> http://43.204.32.121:3000
String globalApiUrl = "https://project-api-jayesh.onrender.com";
String postLabelName = "Ask Question";
var appBarElevation = 0.5;
int scrollIndex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            subtitle2: TextStyle(fontSize: 12),
          )),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  static const String KEY_LOGIN = "isLogin";
  static const String KEY_LOGIN_DETAILS = "authToken";

  @override
  void initState() {
    super.initState();
    logInPageSkip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Lottie.asset('assets/anim/splash_bg.json', fit: BoxFit.cover, repeat: false),
          ),
          Center(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              color: Colors.white,
              child: Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/logo.png',
                    height: 220.0,
                    width: 220.0,
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  void logInPageSkip() async {
    var shardPref = await SharedPreferences.getInstance();
    var isLoggedIn = shardPref.getBool(KEY_LOGIN);

    Timer(Duration(milliseconds: 2400), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        title: 'Home Page',
                      )));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => WelcomePage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      }
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int pageIndex = 0;
  int tabIndex = 0;

  final screens = [
    DiscussionPage(),
    RanksPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appBars = [
      PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: appBarElevation,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Stock HIVE',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(
          //       Icons.calculate,
          //     ),
          //     onPressed: () {
          //       // do something
          //     },
          //   )
          // ],
        ),
      ),
      // AppBar(
      //   elevation: appBarElevation,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Discussion',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      // AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'My Games',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: appBarElevation,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Leaderboard',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () async{
                  RanksPageState.scrollToIndex(scrollIndex); // Scrolling Index for My Rank
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        'My Rank',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      null,
      // AppBar(
      //   centerTitle: true,
      //   elevation: appBarElevation,
      //   backgroundColor: Colors.white,
      //   title: InkWell(
      //     onTap: () {
      //       showSearch(
      //           context: context,
      //           delegate: CustomSearch());
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Expanded(child: Text("Search")),
      //           Align(
      //               alignment: Alignment.topRight,
      //               child: Icon(Icons.search, size: 30,)),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ];

    return Scaffold(
      backgroundColor: defaultBgColor(),
      appBar: appBars[tabIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 16, right: 10, left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              pageIndex = index;
              switch (pageIndex) {
                case 0:
                  tabIndex = 0;
                  break;
                case 1:
                  tabIndex = 1;
                  break;
                case 2:
                  tabIndex = 2;
                  break;
                case 3:
                  tabIndex = 3;
                  break;
                case 4:
                  tabIndex = 4;
                  break;
                default:
                  tabIndex = 0;
              }
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/rank2.png'),
                size: 28,
              ),
              label: 'Rank',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: pageIndex,
          selectedItemColor: defaultColorTabSe(),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(color: defaultBgColor(), child: screens[pageIndex]),
    );
  }
}
