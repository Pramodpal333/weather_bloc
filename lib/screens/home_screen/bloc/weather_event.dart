part of 'weather_bloc.dart';


@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props=>[];
}


class FetchWeather extends WeatherEvent{
  final Position position;

  const FetchWeather({required this.position});

  @override
  List<Object> get props=>[];
}