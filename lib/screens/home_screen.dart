import 'dart:ui';

import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('BMI Calculator',
                style: TextStyle(
                    color: accentHexColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                      width: 120,
                      child: TextField(
                        controller: _heightController,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                            color: accentHexColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Height',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 35,
                                color: Colors.white.withOpacity(.8))),
                        keyboardType: TextInputType.number,
                      )),
                ),
                Center(
                  child: Container(
                      width: 120,
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                            color: accentHexColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Weight',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 35,
                                color: Colors.white.withOpacity(.8))),
                        keyboardType: TextInputType.number,
                      )),
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You are over weight";
                  } else if (_bmiResult >= 18 && _bmiResult < 25) {
                    _textResult = "You are normal weight";
                  } else {
                    _textResult = "You are under weight";
                  }
                });
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                    color: accentHexColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    color: accentHexColor,
                    fontSize: 100,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Visibility(
                visible: _textResult.isNotEmpty,
                child: Text(
                  _textResult,
                  style: TextStyle(color: accentHexColor, fontSize: 20),
                )),
            SizedBox(height: 70),
            RightBar(barWidth: 40),
            SizedBox(height: 30),
            RightBar(barWidth: 70),
            SizedBox(height: 30),
            RightBar(barWidth: 40),
            SizedBox(height: 30),
            LeftBar(barWidth: 70),
            SizedBox(height: 30),
            LeftBar(barWidth: 70),
          ]),
        ));
  }
}
