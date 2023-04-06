import 'package:weather/form_screen.dart';
import 'package:weather/info_screen.dart';
import 'package:weather/movie_reviews.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Center(child: SafeArea(child: Text("Hello Flutter!!")))
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      // home: InfoScreen(),
      routes: {
        '/': (context) => const InfoScreen(),
        '/movieReview': (context) => const MovieReview(),
        '/weather': (context) => const WeatherScreen(),
        '/form': (context) => const MultiWidgetForm(),
      },
      initialRoute: '/',
    );
  }
}
