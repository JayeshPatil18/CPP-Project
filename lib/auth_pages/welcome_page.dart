import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stock_prediction/auth_pages/signin.dart';
import 'package:stock_prediction/auth_pages/signup.dart';
import 'package:stock_prediction/color_helper/defaultColor.dart';
import 'package:stock_prediction/font_helper/default_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  int currentIndex = 0;

  List sections = [
    Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 60),
          alignment: Alignment.center,
          child: Lottie.asset('assets/anim/predict_img.json',
              height: 300, reverse: false, repeat: true, fit: BoxFit.cover),
        ),
        Align(
            alignment: AlignmentDirectional.bottomCenter, // <-- SEE HERE
            child: Text('Predict & Win', style: textBigSubtitle())),
      ],
    ),
    Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 40),
          alignment: Alignment.center,
          child: Lottie.asset('assets/anim/contest_img.json',
              height: 280, reverse: false, repeat: true, fit: BoxFit.cover),
        ),
        Align(
            alignment: AlignmentDirectional.bottomCenter, // <-- SEE HERE
            child: Text('Join Contests', style: textBigSubtitle())),
      ],
    ),
    Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: Lottie.asset('assets/anim/discuss_img.json',
              height: 300, reverse: false, repeat: true, fit: BoxFit.cover),
        ),
        Align(
            alignment: AlignmentDirectional.bottomCenter, // <-- SEE HERE
            child: Text('Discuss', style: textBigSubtitle())),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
      children: [

        Container(
          height: 340,
          margin: EdgeInsets.only(top: 80, bottom: 10),
        child: Lottie.asset('assets/anim/wel_page.json'),
        ),

        // Container(
          //     height: 340,
          //     margin: EdgeInsets.only(top: 40, bottom: 40),
          //     child: ListView(
          //       children: [
          //         CarouselSlider(
          //           items: [
          //             //1st Image of Slider
          //             sections[0],
          //
          //             //2nd Image of Slider
          //             sections[1],
          //
          //             //3rd Image of Slider
          //             sections[2],
          //           ],
          //
          //           //Slider Container properties
          //           options: CarouselOptions(
          //             height: 300.0,
          //             enlargeCenterPage: true,
          //             autoPlay: true,
          //             aspectRatio: 16 / 9,
          //             autoPlayCurve: Curves.fastOutSlowIn,
          //             enableInfiniteScroll: true,
          //             autoPlayAnimationDuration: Duration(milliseconds: 800),
          //             viewportFraction: 0.8,
          //             onPageChanged: (index, reason) {
          //               setState(() {
          //                 currentIndex = index;
          //               });
          //             },
          //           ),
          //         ),
          //       ],
          //     )),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: sections.map((section) {
          //     return Container(
          //       width: 10,
          //       height: 10,
          //       margin: EdgeInsets.symmetric(horizontal: 4),
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: currentIndex == sections.indexOf(section)
          //               ? Colors.black
          //               : Color(0xffeaeaea)),
          //     );
          //   }).toList(),
          // ),
          Container(
              margin: EdgeInsets.only(top: 60),
              child: Text('Welcome', style: textBig())),

          Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 60, left: 40, right: 40),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                  ))),

          Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 40, right: 40),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                          side: BorderSide(color: Colors.black, width: 1.4)
                      )),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                  ))),
      ],
    ),
        ));
  }
}
