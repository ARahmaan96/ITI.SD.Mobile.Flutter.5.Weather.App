import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherData extends StatelessWidget {
  final Weather weather;
  const WeatherData({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 90,
          child: Image.network(
            weather.icon,
          ),
        ),
        Text(
          weather.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          weather.country,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          weather.time,
          style: const TextStyle(fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Min Temp:  ${weather.minTemp.toString()}",
            ),
            Text(
              weather.temp.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Text('Max Temp: ${weather.maxTemp}'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(weather.condition, style: const TextStyle(fontSize: 30)),
          ),
        )
      ],
    );
  }
}
