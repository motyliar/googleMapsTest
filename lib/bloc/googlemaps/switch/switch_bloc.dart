import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchBool: true)) {
    on<SwitchOnnEvent>((
      event,
      emit,
    ) {
      emit(SwitchState(switchBool: true));
    });
    on<SwitchOfffEvent>(
        ((event, emit) => emit(SwitchState(switchBool: false))));
  }
}
