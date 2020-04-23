import 'package:flutter/material.dart';


class MyCard extends StatelessWidget{

  final Color colour;
  final Widget cardChild;
  final Function onClick;
  MyCard({@required this.colour, this.cardChild, this.onClick});
  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
