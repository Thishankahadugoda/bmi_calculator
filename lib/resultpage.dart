import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.resultText, this.getInterpretation});
  final String bmiResult;
  final String resultText;
  final String getInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' BMI Calculator   ', style: kLabelText),
        centerTitle: (true),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text('Your Result', style: kResuultLabel),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('NORMAL', style: kResultTextStyle),
                  Text(bmiResult, style: kBMIstyle),
                  Text('good job. yoyr bmi score is normal',
                      style: kBodystyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Bottombutton(
              button_title: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
