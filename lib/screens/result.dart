import 'package:bmi/components/bottombutton.dart';
import 'package:bmi/components/mycard.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class ResultPage extends StatelessWidget {
  final bmiResult;
  final status;
  final inter;
  ResultPage({@required this.bmiResult,@required  this.status,@required  this.inter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator "),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Text("Your Result", style: kBigStyle,)),
          Expanded(
            flex: 5,
            child: MyCard(
              colour: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(status, style: TextStyle(
                    color: Color(0xFF24D876),
                    fontSize: 20
                  ),),
                  Text(bmiResult, style: kBigStyle,),
                  Text(inter, textAlign: TextAlign.center, style: kMyTextStyle,)
                ],
              ),
            ),
          ),
          BottomButton(
            onClick: (){
              Navigator.pop(context);
            },
            label: "RE-CALCULATE",
          )
        ],
      ),
    );
  }
}
