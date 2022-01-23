import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

// Run|Debug|Profile
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(

      ),
    );
  }
}
