import 'package:advflutterch3/screens/chrome/provider/chrome_provider.dart';
import 'package:advflutterch3/screens/chrome/view/chrome_screen.dart';
import 'package:advflutterch3/screens/connectivity/connectivity_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChromeProvider(),)
    ],

      builder:(context, child) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChromeScreen(),
    );
  }
}

