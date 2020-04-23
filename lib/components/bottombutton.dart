import 'package:flutter/material.dart';

import 'constants.dart';


class BottomButton extends StatelessWidget{

  final Function onClick;
  final String label;
  BottomButton({this.onClick, this.label});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(child: Text(label, style: kLargeStyle, textAlign: TextAlign.center,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        width: double.infinity,

      ),
    );
  }

}
