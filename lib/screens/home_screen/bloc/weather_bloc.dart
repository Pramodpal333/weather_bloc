import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_bloc/api_constants/constants.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>(fetchWeather);
  }

  Future<FutureOr<void>> fetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    try{
      emit(WeatherLoadingState());
      WeatherFactory wf = WeatherFactory(Constant.apiKey,language: Language.ENGLISH);

      Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);

      print("Fetch Weather Fun ---> $weather");
      emit(WeatherSuccessState(weather: weather));

    }catch(e){
      print("Fetch weather Event Catch ----> $e");
    }
  }
}
