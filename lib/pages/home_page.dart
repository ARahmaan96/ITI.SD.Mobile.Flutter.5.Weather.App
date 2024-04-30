import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/component/error_component.dart';
import 'package:weather_app/component/nodata_component.dart';
import 'package:weather_app/component/weather_data_component.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const NoDataComponent();
          } else if (state is WeatherLoading) {
            return const SpinKitRing(
              color: Colors.white,
              size: 50.0,
            );
          } else if (state is WeatherLoaded) {
            return WeatherData(weather: state.weather);
          } else if (state is WeatherError) {
            return const ErrorComponent();
          } else {
            return const NoDataComponent();
          }
        },
      ),
    );
  }
}
