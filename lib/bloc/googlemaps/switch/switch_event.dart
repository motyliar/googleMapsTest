// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnnEvent extends SwitchEvent {}

class SwitchOfffEvent extends SwitchEvent {}
