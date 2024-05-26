import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/Screens/DashBoard/DashBoard.dart';


final splashProvider = ChangeNotifierProvider((ref) => _splash());


class _splash extends ChangeNotifier{

  onInit(context){
    Timer(Duration(seconds: 3), (){
      try{
        Navigator.pushReplacement(context!, MaterialPageRoute(builder: (c)=>DashBoard()));
      }catch(d){
        print("Navigation Fail $d");
      }
    });
  }

}