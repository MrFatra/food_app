import 'package:flutter/material.dart';

// packages
import 'package:food_app/pages/homepage.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.indigo,
        ),
        home: const Homepage());
  }
}
