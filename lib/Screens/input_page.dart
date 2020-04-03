import 'package:bmicalculator/Screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/Component/icon_content.dart';
import 'package:bmicalculator/Component/reusable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'result_page.dart';
import 'package:bmicalculator/Component/bottom_button.dart';
import 'package:bmicalculator/Component/round_icon.dart';
import 'package:bmicalculator/calculat_brain.dart';


  // علشان احدد انا فين من ذكر او انثي
 enum Gender{ male , female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {



  Gender  selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    // شرط لتحديد المكان اللي انا فيه علشان اغير لونه علشان احدده
                    color1: selectedGender == Gender.male ? KActiveCardColor : KInactiveCardColor ,
                    childCard: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text1: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color1: selectedGender == Gender.female ? KActiveCardColor : KInactiveCardColor,
                    childCard: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text1: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                color1: KActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT",
                    style: KLabelTextStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        // السطر دا مهم و مرتبط بالسطر اللي فوقيه علي طول علشان يخلي الكلام علي نفس مستوي السطر
                        textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                           height.toString() ,
                        style: KNumberTextStyle1
                        ),
                        Text('cm',
                        style: KLabelTextStyle,
                        )
                      ],
                    ),
                    // للتحكم بشكل اكبر في كل صغيره و كبيره لل slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor:Color(0xffEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      color1: KActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',
                          style: KLabelTextStyle,),
                          SizedBox(height: 15.0,),
                          Text(
                            weight.toString(),
                            style: KNumberTextStyle1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressControl: (){
                                    setState(() {
                                      weight--;
                                    });
                                },
                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressControl: (){
                                    setState(() {
                                      weight++;
                                    });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(color1: KActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                        style: KLabelTextStyle,),
                        SizedBox(height: 15.0,),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressControl: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressControl: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onPressAction: (){
              CalculateBrain calc = CalculateBrain(
                height: height,
                weight: weight,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) {
                    return ResultPage(
                      bmiResult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  }
                  ));
            }
          )
        ],
      ),
    );
  }



}


