// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchBool;
  const SwitchState({
    required this.switchBool,
  });

  @override
  List<Object> get props => [switchBool];
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required super.switchBool});
}
