import 'package:bmi/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NiceCard extends StatefulWidget {
  final String label;
  int val;
  NiceCard({@required this.label,@required this.val});

  @override
  _NiceCardState createState() => _NiceCardState();
}

class _NiceCardState extends State<NiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.label),
          Text(widget.val.toString(), style: kBigStyle,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedIconButton(icon: FontAwesomeIcons.minus, onClick: (){
                setState(() {
                  widget.val < 1? 0: widget.val--;
                });
              },),
              SizedBox(width: 15,),
              RoundedIconButton(icon: FontAwesomeIcons.plus, onClick: (){
                setState(() {
                  widget.val >300 ? 300: widget.val++;
                });
              },),
            ],
          )
        ],
      ),

    );
  }
}

class RoundedIconButton extends StatelessWidget {
  @override
  final IconData icon ;
  final Function onClick;
  RoundedIconButton({@required this.icon, this.onClick});
  Widget build(BuildContext context) {
    return RawMaterialButton(
     child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      elevation: 0,
      onPressed: onClick,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
