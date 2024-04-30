import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/wether.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeathetLoader()),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 71, 70, 70),
        )),
        home: Home(),
      ),
    );
  }
}
