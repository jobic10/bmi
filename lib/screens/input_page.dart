import 'package:bmi/components/NiceCard.dart';
import 'package:bmi/components/bottombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/mycard.dart';
import '../components/icon_content.dart';
import '../components/constants.dart';
import 'result.dart';
import 'package:bmi/brain.dart';

enum Gender {
male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator "),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: MyCard(colour: (selectedGender == Gender.male ? kActiveCard:kInactiveCard), cardChild:
                    IconContent(text: "MALE", icon: FontAwesomeIcons.male,),
                    onClick: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    }
                    ,)),
                  Expanded(child: MyCard(colour: (selectedGender == Gender.female? kActiveCard: kInactiveCard),
                      cardChild:
                      IconContent(text: "FEMALE", icon: FontAwesomeIcons.facebookSquare,),
                    onClick: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                    },

                  )),
                ],
              ),
            ),
            Expanded(child: MyCard(colour: (kActiveCard),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text("${height.toString()}",
                    style: kBigStyle
                    ),
                    Text("cm", style: kMyTextStyle,),

                  ],

                ),
                Slider(
                  value: height.toDouble(),
                  min: 100,
                  max: 220,

                  onChanged: (val){
                    setState(() {
                      height = val.floor();
                    });
                  },
                )
              ],
            ),
            )),
           Expanded(
             child:  Row(
               children: <Widget>[
                 Expanded(child: MyCard(colour: (kActiveCard), cardChild: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text("WEIGHT"),
                       Text(weight.toString(), style: kBigStyle,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           RoundedIconButton(icon: FontAwesomeIcons.minus, onClick: (){
                             setState(() {
                               weight < 1? 0: weight--;
                             });
                           },),
                           SizedBox(width: 15,),
                           RoundedIconButton(icon: FontAwesomeIcons.plus, onClick: (){
                             setState(() {
                               weight >300 ? 300: weight++;
                             });
                           },),
                         ],
                       )
                     ],
                   ),

                 ),)),
                 Expanded(child: MyCard(colour: (kActiveCard), cardChild: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text("AGE"),
                       Text(age.toString(), style: kBigStyle,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           RoundedIconButton(icon: FontAwesomeIcons.minus, onClick: (){
                             setState(() {
                               age < 1? 0: age--;
                             });
                           },),
                           SizedBox(width: 15,),
                           RoundedIconButton(icon: FontAwesomeIcons.plus, onClick: (){
                             setState(() {
                               age < 1? 0: age++;
                             });
                           },),
                         ],
                       )
                     ],
                   ),

                 ),)),
               ],
             ),
           ),
            BottomButton(
              label: "CALCULATE",
              onClick: (){

                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ResultPage(bmiResult: calc.calcBMI(), inter: calc.getInterpretation(), status: calc.getResult(),),
                ));
              },
            )
          ],
        )

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
