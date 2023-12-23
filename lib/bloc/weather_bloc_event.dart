part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class Fetchweather extends WeatherBlocEvent {
  final Position position;

  const Fetchweather(this.position);
  List<Object> get props => [position];
}
