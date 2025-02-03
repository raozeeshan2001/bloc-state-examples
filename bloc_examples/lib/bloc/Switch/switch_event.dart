import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class enableanddisablenotification extends SwitchEvent {}

class slidervalue extends SwitchEvent {
  double slider;
  slidervalue({required this.slider});
  @override
  List<Object> get props => [slider];
}
