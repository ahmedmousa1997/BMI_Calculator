import 'dart:math';

class CalculateBrain{

  final int weight;
  final int height;
  double _bmi;

  CalculateBrain({this.weight,this.height});

  String calculateBmi(){

    _bmi = weight / pow(height/100, 2);
    // علشان ياخد حرف واحد بس بعد العلامه العشريه
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OverWeight';
    } else if(_bmi>18.5){
      return 'Normale';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }





}