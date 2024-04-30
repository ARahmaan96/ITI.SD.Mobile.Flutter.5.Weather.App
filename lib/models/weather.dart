class Weather {
  final String icon;
  final String time;
  final String name;
  final String country;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final String condition;

  Weather.weather(
      {required this.country,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.condition,
      required this.icon,
      required this.name,
      required this.time});
  factory Weather.fromJson(json) {
    final currentTempJson = json["forecast"]["forecastday"][0]["day"];

    return Weather.weather(
      icon: "http:${json["current"]["condition"]["icon"]}",
      time: json["location"]["localtime"],
      condition: json["current"]["condition"]["text"],
      country: json["location"]["country"],
      name: json["location"]["name"],
      minTemp: currentTempJson["mintemp_c"],
      temp: currentTempJson["avgtemp_c"],
      maxTemp: currentTempJson["maxtemp_c"],
    );
  }
}
