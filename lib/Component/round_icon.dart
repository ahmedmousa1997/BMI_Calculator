import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressControl;

  RoundIconButton({@required this.icon,@required this.onPressControl});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      onPressed: (){
        onPressControl();
      },
      elevation: 6.0,
      child: Icon(icon),
      fillColor: Color(0xff4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),

    );
  }
}
