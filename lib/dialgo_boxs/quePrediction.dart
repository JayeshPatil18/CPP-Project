import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_prediction/color_helper/defaultColor.dart';
import '../components/queCard.dart';
import '../font_helper/default_fonts.dart';

class QueDialogBox extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 60,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: defaultBgColor()
              ),
            ),
          QuestionCard(),
          Container(
            margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: (){

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Join with ', style: textStyleBtn(textColor: Colors.white)),
                    Text('10', style: textStyleBtn(textColor: Colors.white)),
                    Icon(Icons.currency_rupee, color: starColor()),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }

}