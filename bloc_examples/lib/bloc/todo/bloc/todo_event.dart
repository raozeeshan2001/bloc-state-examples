part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class addtodoevent extends TodoEvent {
  String task;
  addtodoevent({required this.task});
  @override
  List<Object> get props => [task];
}

class removetodoevent extends TodoEvent {
  Object task;
  removetodoevent({required this.task});
  @override
  List<Object> get props => [task];
}
