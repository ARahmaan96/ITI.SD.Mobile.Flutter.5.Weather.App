import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  String keyword = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            onChanged: (value) => keyword = value,
            onSubmitted: (value) => searchKeyword(),
            decoration: InputDecoration(
              filled: true, // Enable background filling
              fillColor: Colors.blueGrey[50], // Your desired background color
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
              onPressed: () {
                searchKeyword();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Search City",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )),
        )
      ],
    );
  }

  void searchKeyword() {
    BlocProvider.of<WeatherCubit>(context).getWeather(keyword);
    Navigator.pop(context);
  }
}
