import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shark/containers/mainActivity.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalunde Loans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainActivity(),
    );
  }
}
