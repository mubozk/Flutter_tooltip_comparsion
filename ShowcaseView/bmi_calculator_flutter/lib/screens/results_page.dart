import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:showcaseview/showcaseview.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final _key1 = GlobalKey();
  BuildContext? myContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 400), () {
        ShowCaseWidget.of(myContext!)!.startShowCase([_key1]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
          return Scaffold(
            appBar: AppBar(
              title: Text('BMI CALCULATOR'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Your Result',
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.resultText.toUpperCase(),
                          style: kResultTextStyle,
                        ),
                        Text(
                          widget.bmiResult,
                          style: kBMITextStyle,
                        ),
                        Text(
                          widget.interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Showcase(
                  key: _key1,
                  title: 'Recalculate',
                  description:
                      'Try recalculate and ask your friend their physical info',
                  showcaseBackgroundColor: Colors.indigo,
                  textColor: Colors.white,
                  child: BottomButton(
                    buttonTitle: 'RE-CALCULATE',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
