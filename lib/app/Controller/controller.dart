import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{

  //Text Editing Controllers
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //Default message
  RxString information = "Type your weight(kilograms) and height(meters)".obs;

  //A method that erases field information.
  void resetButton() {

    weightController.text = "";
    heightController.text = "";
    information.value = "Type your weight(kilograms) and height(meters)";
    update();

  }

  //A method that calculates Body Mass Index
  void calculate(){
    double weight = double.parse(weightController.text.replaceAll(',', '.'));
    double height = double.parse(heightController.text.replaceAll(',', '.'));

    double bmi = weight / pow(height, 2);

    if(bmi<18.5){
      information.value = "You're underweight (BMI = ${bmi.toStringAsPrecision(4)}).";
      update();
    }else if(bmi>24.9){
      information.value = "You're overweight (BMI = ${bmi.toStringAsPrecision(4)}). ";
      update();
    }else{
      information.value = "You're at your ideal weight! (BMI = ${bmi.toStringAsPrecision(4)}). ";
      update();
    }
  }


}