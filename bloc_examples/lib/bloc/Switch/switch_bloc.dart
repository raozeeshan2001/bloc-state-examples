import 'package:bloc/bloc.dart';
import 'package:bloc_examples/bloc/Switch/switch_event.dart';
import 'package:bloc_examples/bloc/Switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<enableanddisablenotification>(_enableanddisablenotification);
    on<slidervalue>(_slider);
  }
  void _enableanddisablenotification(
      enableanddisablenotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(slidervalue event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
