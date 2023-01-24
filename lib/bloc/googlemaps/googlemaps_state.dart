// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'googlemaps_bloc.dart';

class GooglemapsState extends Equatable {
  bool onChange;
  GooglemapsState([this.onChange = true]);

  @override
  List<Object> get props => [onChange];
}

class GooglemapsLoading extends GooglemapsState {
  GooglemapsLoading();
}

class GooglemapsInitial extends GooglemapsState {
  BitmapDescriptor customidIcon;
  BitmapDescriptor custom;

  GooglemapsInitial({
    required this.customidIcon,
    required this.custom,
  });
  @override
  List<Object> get props => [
        customidIcon,
        custom,
      ];
}
