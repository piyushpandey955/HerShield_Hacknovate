import 'package:flutter/material.dart';
import 'package:hershield_1/login.dart';
import 'package:hershield_1/register.dart';
import 'package:hershield_1/home.dart';

void main() {
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: 'login', 
      routes: {
        'login':(context) =>const Mylogin(),
        'register':(context)=>const MyRegister(),
        'home':(context) =>const MyApp()
        },
    ),
  );
}

