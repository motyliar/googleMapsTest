part of 'googlemaps_bloc.dart';

abstract class GooglemapsEvent extends Equatable {
  const GooglemapsEvent();

  @override
  List<Object> get props => [];
}

class GoogleMapsLoadingEvent extends GooglemapsEvent {}

class SwitchOnEvent extends GooglemapsEvent {}

class SwitchOffEvent extends GooglemapsEvent {}
