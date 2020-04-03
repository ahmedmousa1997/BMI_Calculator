import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final String buttonTitle;
  final Function onPressAction;

  BottomButton({@required this.buttonTitle,@required this.onPressAction });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressAction,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle,
          style: KLargeBottomStyle,
        ),
        padding: EdgeInsets.only(bottom: 10.0),
        color: KBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: KBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

