import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15,
          ),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
          thumbColor: Color(0xFFEB1555),
          activeTrackColor: Colors.white,
          inactiveTrackColor: Color(0xFF8D8E98),
          overlayColor: Color(0x29EB1555),
        ),
      ),
      home: InputPage(),
    );
  }
}
