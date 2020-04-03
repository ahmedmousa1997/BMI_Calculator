import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/Component/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/Component/bottom_button.dart';


class ResultPage extends StatelessWidget {

  final String bmiResult ;
  final String resultText;
  final String interpretation;

  ResultPage({@required this.bmiResult,@required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATE",),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text('Your Result',
              style: KResultTitle
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color1: KActiveCardColor,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                children: <Widget>[
                  Text(resultText.toUpperCase(),
                    style: KTextResult
                  ),
                  Text(
                    bmiResult,
                    style: KNumberTextStyle1,
                  ),
                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: KBodyTextStyle,)
                ],
              ),

            )
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onPressAction: (){
                Navigator.pop(context);
              },
            ),
          ),
          

        ],

      ),
    );
  }
}

