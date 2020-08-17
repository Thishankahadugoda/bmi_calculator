import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'resultpage.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender selectedCard;
  int heiht = 180;
  int weight = 30;
  int age = 10;
//  Color maleCardColor = innactiveCardColor;
//  Color femaleCardColor = innactiveCardColor;
//
//  //male=1, female==2
//  void updateColor(Gender type) {
//    if (type == Gender.Male) {
//      if (maleCardColor == innactiveCardColor) {
//        maleCardColor = activeCardcolor;
//        femaleCardColor = innactiveCardColor;
//      } else {
//        maleCardColor = innactiveCardColor;
//      }
//    } else if (type == Gender.Female) {
//      if (femaleCardColor == innactiveCardColor) {
//        femaleCardColor = activeCardcolor;
//        maleCardColor = innactiveCardColor;
//      } else {
//        femaleCardColor = innactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator '),
        centerTitle: (true),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedCard = Gender.Male;
                      });
                    },
                    colour: selectedCard == Gender.Male
                        ? kActiveCardcolor
                        : kInnactiveCardColor,
                    cardChild:
                        Iconcard(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedCard = Gender.Female;
                      });
                    },
                    colour: selectedCard == Gender.Female
                        ? kActiveCardcolor
                        : kInnactiveCardColor,
                    cardChild:
                        Iconcard(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kLabelText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heiht.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelText,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                        value: heiht.toDouble(),
                        min: 100.0,
                        max: 250.0,
                        // activeColor: Colors.white,
                        inactiveColor: Color(0xFF8E8D98),
                        onChanged: (double newValue) {
                          setState(() {
                            heiht = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
              colour: kActiveCardcolor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelText),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelText),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(
            button_title: 'Calculate',
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: heiht, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: cal.calculatorBMI(),
                    //resultText: cal.getResult(),
                    //getInterpretation: cal.getInterpretation(),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
