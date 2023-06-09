import 'package:flutter/material.dart';
import 'package:stock_prediction/font_helper/default_fonts.dart';
import '../dialgo_boxs/predictDialogBox.dart';


// Two Options Buttons
class OptionButtonsTwo extends StatefulWidget {

  final String label1;
  final String label2;

  OptionButtonsTwo({
    required this.label1,
    required this.label2,
  });

  @override
  State<StatefulWidget> createState() {

    BtnValues.label1 = label1;
    BtnValues.label2 = label2;

    return _OptionButtonsTwoState();
  }
}

class _OptionButtonsTwoState extends State<OptionButtonsTwo> {
  bool _isSelectedFirst = false;
  bool _isSelectedSecond = false;


  void _toggleSelectionFirst() {
    setState(() {
      if(_isSelectedFirst){
        _isSelectedFirst = false;
      }else{
        _isSelectedFirst = true;
        _isSelectedSecond = false;
      }
    });
    showDialogPredict(context,  0);
  }

  void _toggleSelectionSecond() {
    setState(() {
      if(_isSelectedSecond){
        _isSelectedSecond = false;
      }else{
        _isSelectedFirst = false;
        _isSelectedSecond = true;
      }
    });
    showDialogPredict(context,  1);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionFirst();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedFirst ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel1(), style: textStyleBtn(textColor: _isSelectedFirst ? Colors.white : Colors.black)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionSecond();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedSecond ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel2(), style: textStyleBtn(textColor: _isSelectedSecond ? Colors.white : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  void showDialogPredict(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
            )
        ),
        builder: (context) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.80,
          maxChildSize: 0.96,
          minChildSize: 0.60,
          builder: (context, scrollContoller) => SingleChildScrollView(
            controller: scrollContoller,
            child: QueDialogBox(selectedIndex: index),
          ),
        ));
  }
}


// Third Options Buttons
class OptionButtonsThird extends StatefulWidget {

  final String label1;
  final String label2;
  final String label3;

  OptionButtonsThird({
    required this.label1,
    required this.label2,
    required this.label3,
  });

  @override
  State<StatefulWidget> createState() {

    BtnValues.label1 = label1;
    BtnValues.label2 = label2;
    BtnValues.label3 = label3;

    return _OptionButtonsThirdState();
  }
}

class _OptionButtonsThirdState extends State<OptionButtonsThird> {
  bool _isSelectedFirst = false;
  bool _isSelectedSecond = false;
  bool _isSelectedThird = false;

  void _toggleSelectionFirst() {
    setState(() {
      if(_isSelectedFirst){
        _isSelectedFirst = false;
      }else{
        _isSelectedFirst = true;
        _isSelectedSecond = false;
        _isSelectedThird = false;
      }
    });
    showDialogPredict(context,  0);
  }

  void _toggleSelectionSecond() {
    setState(() {
      if(_isSelectedSecond){
        _isSelectedSecond = false;
      }else{
        _isSelectedFirst = false;
        _isSelectedSecond = true;
        _isSelectedThird = false;
      }
    });
    showDialogPredict(context,  1);
  }

  void _toggleSelectionThird() {
    setState(() {
      if(_isSelectedThird){
        _isSelectedThird = false;
      }else{
        _isSelectedFirst = false;
        _isSelectedSecond = false;
        _isSelectedThird = true;
      }
    });
    showDialogPredict(context,  2);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionFirst();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedFirst ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel1(), style: textStyleBtn(textColor: _isSelectedFirst ? Colors.white : Colors.black)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionSecond();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedSecond ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel2(), style: textStyleBtn(textColor: _isSelectedSecond ? Colors.white : Colors.black)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionThird();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedThird ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel3(), style: textStyleBtn(textColor: _isSelectedThird ? Colors.white : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  void showDialogPredict(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
            )
        ),
        builder: (context) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.80,
          maxChildSize: 0.96,
          minChildSize: 0.60,
          builder: (context, scrollContoller) => SingleChildScrollView(
            controller: scrollContoller,
            child: QueDialogBox(selectedIndex: index),
          ),
        ));
  }
}


// Four Options Buttons
class OptionButtonsFour extends StatefulWidget {

  final String label1;
  final String label2;
  final String label3;
  final String label4;

  OptionButtonsFour({
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4
  });

  @override
  State<StatefulWidget> createState() {

    BtnValues.label1 = label1;
    BtnValues.label2 = label2;
    BtnValues.label3 = label3;
    BtnValues.label4 = label4;

    return _OptionButtonsFourState();
  }
}

class _OptionButtonsFourState extends State<OptionButtonsFour> {
  bool _isSelectedFirst = false;
  bool _isSelectedSecond = false;
  bool _isSelectedThird = false;
  bool _isSelectedFour = false;


  void _toggleSelectionFirst() {
    setState(() {
      if(_isSelectedFirst){
        _isSelectedFirst = false;
      }else{
        _isSelectedFirst = true;
        _isSelectedSecond = false;
        _isSelectedThird = false;
        _isSelectedFour = false;
      }
    });
    showDialogPredict(context,  0);
  }

  void _toggleSelectionSecond() {
    setState(() {
      if(_isSelectedSecond){
        _isSelectedSecond = false;
      }else{
        _isSelectedFirst = false;
        _isSelectedSecond = true;
        _isSelectedThird = false;
        _isSelectedFour = false;
      }
    });
    showDialogPredict(context,  1);
  }

  void _toggleSelectionThird() {
    setState(() {
      if(_isSelectedThird){
        _isSelectedThird = false;
      }else{
        _isSelectedFirst = false;
        _isSelectedSecond = false;
        _isSelectedThird = true;
        _isSelectedFour = false;
      }
    });
    showDialogPredict(context,  2);
  }

  void _toggleSelectionFour() {
    setState(() {
      if(_isSelectedFour){
        _isSelectedFour = false;
      }else{
        _isSelectedFirst = false;
        _isSelectedSecond = false;
        _isSelectedThird = false;
        _isSelectedFour = true;
      }
    });
    showDialogPredict(context,  3);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionFirst();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedFirst ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel1(), style: textStyleBtn(textColor: _isSelectedFirst ? Colors.white : Colors.black)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionSecond();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedSecond ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel2(), style: textStyleBtn(textColor: _isSelectedSecond ? Colors.white : Colors.black)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionThird();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedThird ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel3(), style: textStyleBtn(textColor: _isSelectedThird ? Colors.white : Colors.black)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _toggleSelectionFour();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
                backgroundColor: MaterialStateProperty.all<Color>(_isSelectedFour ? Colors.black : Colors.white),
              ),
              child: Text(BtnValues.getLabel4(), style: textStyleBtn(textColor: _isSelectedFour ? Colors.white : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  void showDialogPredict(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
            )
        ),
        builder: (context) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.80,
          maxChildSize: 0.96,
          minChildSize: 0.60,
          builder: (context, scrollContoller) => SingleChildScrollView(
            controller: scrollContoller,
            child: QueDialogBox(selectedIndex: index),
          ),
        ));
  }
}

class BtnValues{
  static String label1 = "";
  static String label2 = "";
  static String label3 = "";
  static String label4 = "";

  static String getLabel1(){
    return  label1;
  }

  static String getLabel2(){
    return  label2;
  }

  static String getLabel3(){
    return  label3;
  }

  static String getLabel4(){
    return  label4;
  }
}