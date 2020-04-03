import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

            // required يعني لازم استخدمها لما استدعي الكلاس دا
           // و الباقي عادي عندي الحريه استدعيه او لا علي حسب احتياجي
  ReusableCard({@required this.color1, this.childCard, this.onPress});

  final Color color1;
  final Widget childCard;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.5),
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }



}