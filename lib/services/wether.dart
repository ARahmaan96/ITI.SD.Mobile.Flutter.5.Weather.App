import 'dart:async';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';

Dio dio = Dio();

class WeathetLoader {
  final String _APIEndPoint = "http://api.weatherapi.com/v1/forecast.json";
  final String _APIKey = "340e292a44b3402dbe0123511242404";

  Future<Weather?> load(String cityName) async {
    String url =
        '$_APIEndPoint?key=$_APIKey&q=$cityName&days=3&aqi=no&alerts=no';

    try {
      Response response = await dio.get(url);
      Weather w = Weather.fromJson(response.data);
      print(w.name);
      return w;
    } catch (ex) {}
    return null;
  }
}
