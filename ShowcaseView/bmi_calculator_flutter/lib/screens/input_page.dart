import 'package:bmi_calculator_flutter/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/components/icon_content.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/adjustable_icon_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:showcaseview/showcaseview.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 25;
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();
  final _key4 = GlobalKey();
  final _key5 = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase(
        [
          _key2,
          _key1,
          _key3,
          _key4,
          _key5,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              ShowCaseWidget.of(context)!
                  .startShowCase([_key1, _key2, _key3, _key4, _key5]);
            });
          },
          icon: const Icon(
            Icons.help_rounded,
          ),
        ),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Showcase(
              key: _key1,
              description: 'Choose your gender',
              showcaseBackgroundColor: Colors.indigo,
              descTextStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
              ),
              overlayPadding: const EdgeInsets.all(8),
              contentPadding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: (IconContent(
                        icon: Icon(FontAwesomeIcons.mars),
                        label: 'MALE',
                      )),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: Icon(FontAwesomeIcons.venus),
                      label: 'FEMALE',
                    ),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Showcase(
              key: _key2,
              description: 'Adjust your height',
              shapeBorder: const CircleBorder(),
              showcaseBackgroundColor: Colors.indigo,
              descTextStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
              ),
              overlayPadding: const EdgeInsets.all(8),
              contentPadding: const EdgeInsets.all(20),
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: (Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            (RoundSliderThumbShape(enabledThumbRadius: 15)),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: thumbColor,
                        overlayColor: overlayColor,
                        activeTrackColor: activeTrackingColor,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 110,
                        max: 230,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Showcase(
                  key: _key3,
                  description: 'Enter your weight',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: Colors.indigo,
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AdjustableIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPress: () {
                                print('weight--');
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AdjustableIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                print('weight++');
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
                )),
                Expanded(
                    child: Showcase(
                  key: _key4,
                  description: 'And your age',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: Colors.indigo,
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AdjustableIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPress: () {
                                print('age--');
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AdjustableIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                print('age++');
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
                )),
              ],
            ),
          ),
          Showcase(
            key: _key5,
            description: 'Time to get results',
            shapeBorder: const CircleBorder(),
            showcaseBackgroundColor: Colors.indigo,
            descTextStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
            overlayPadding: const EdgeInsets.all(8),
            contentPadding: const EdgeInsets.all(20),
            child: BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
