import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/wether.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeathetLoader _weathetLoader;
  WeatherCubit(this._weathetLoader) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final Weather? weather = await _weathetLoader.load(cityName);
      if (weather == null) {
        emit(const WeatherError("Error Loading Data"));
      } else {
        emit(WeatherLoaded(weather));
      }
    } catch (err) {
      emit(WeatherError(err.toString()));
    }
  }
}
