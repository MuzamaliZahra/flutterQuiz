import 'package:bmi/add_quiz.dart';
import 'package:bmi/admin_login.dart';
import 'package:bmi/home.dart';
import 'package:bmi/login.dart';
import 'package:bmi/question.dart';
import 'package:bmi/signUp.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAppCheck.instance.activate(

     androidProvider: AndroidProvider.playIntegrity,

  );




  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: //Home(),
             //Question(),
            //Question (category: '',),
      SignUpPage(),
      //LoginPage(),
          //AdminLogin(),
      //AddQuiz(),
    );
  }
}
