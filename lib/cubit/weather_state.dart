part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WeatherLoaded && other.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

final class WeatherError extends WeatherState {
  final String msg;
  const WeatherError(this.msg);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WeatherError && other.msg == msg;
  }

  @override
  int get hashCode => msg.hashCode;
}
