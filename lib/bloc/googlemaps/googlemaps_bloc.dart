import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'googlemaps_event.dart';
part 'googlemaps_state.dart';

class GooglemapsBloc extends Bloc<GooglemapsEvent, GooglemapsState> {
  BitmapDescriptor customidIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor custom = BitmapDescriptor.defaultMarker;
  GooglemapsBloc() : super(GooglemapsLoading()) {
    on<SwitchOnEvent>(switchOn);
    on<SwitchOffEvent>(switchOff);
    on<GooglemapsEvent>((event, emit) async {
      emit(GooglemapsLoading());

      await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), 'images/3.png')
          .then((value) {
        customidIcon = value;
      });
      await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), 'images/2.png')
          .then((value) {
        custom = value;
      });
      emit(GooglemapsInitial(
        customidIcon: customidIcon,
        custom: custom,
      ));
    });
  }

  void switchOn(SwitchOnEvent event, Emitter<GooglemapsState> emit) {
    emit(GooglemapsState(state.onChange = false));
    print(state.onChange);
  }

  void switchOff(SwitchOffEvent event, Emitter<GooglemapsState> emit) {
    emit(GooglemapsState(state.onChange = true));
    print(state.onChange);
  }
}
