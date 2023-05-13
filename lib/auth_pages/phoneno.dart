import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:stock_prediction/font_helper/default_fonts.dart';

import '../utils/token_helper.dart';
import 'number_verify.dart';

class PhoneNum extends StatefulWidget {

  static String verify = "";

  @override
  State<StatefulWidget> createState() {
    return PhoneNumState();
  }
}

class PhoneNumState extends State<PhoneNum> {
  String _buttonText = 'Next';
  var boarderWidth = 1.4;

  final phoneController = TextEditingController();
  String phoneNo = "";
  bool isClicked = false;

  _getTokenUsername() async {
    phoneNo = await getTokenPhoneNo();
    phoneController.text = phoneNo;
  }

  @override
  void initState() {
    _getTokenUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80,bottom: 40, left: 40, right: 40),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //       margin: EdgeInsets.only(top: 20, bottom: 50),
              //       child: Text('Enter Phone Number', style: textBig())),
              

                  TextFormField(
                  controller: phoneController,
                  validator: (String? msg) {
                    msg = msg?.trim();
                    if (msg!.isEmpty) {
                      return "Please enter Phone No.";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Phone No',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                              color: Colors.black, width: boarderWidth)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                              color: Colors.black, width: boarderWidth))),
                ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 60),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      onPressed: () async{

                        if (!isClicked) {

                        setState(() {
                          _buttonText = "Loading...";
                        });
                        
                        // Verification Code sending
                              await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneNo,
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        PhoneNum.verify = verificationId;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verification Code has been sent.')));

                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                     builder: (context) =>
                                        VerifyPhoneNo(phoneNo: phoneNo,)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );

                      isClicked = false;
                        }

                            
                      },
                      child: Text(
                        _buttonText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
