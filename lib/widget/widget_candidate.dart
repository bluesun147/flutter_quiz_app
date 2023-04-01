import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget {
  VoidCallback tap;
  String text;
  int index;
  double width;
  bool answerState;

  // 생성자
  CandWidget(
      {required this.tap,
      required this.index,
      required this.width,
      required this.text,
      required this.answerState});

  // 상태관리 선언
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width * 0.8,
        height: widget.width * 0.1,
        padding: EdgeInsets.fromLTRB(widget.width * 0.048, widget.width * 0.024,
            widget.width * 0.048, widget.width * 0.024),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepOrangeAccent),
          color: widget.answerState ? Colors.deepOrangeAccent : Colors.white,
        ),
        child: InkWell(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.width * 0.035,
                color: widget.answerState ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              setState(() {
                widget.tap();
                widget.answerState = !widget.answerState;
              });
            }));
  }
}
