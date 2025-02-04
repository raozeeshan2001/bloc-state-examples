part of 'todo_bloc.dart';

class TodoState extends Equatable {
  List<String> todolist = [];
  TodoState({this.todolist = const []});

  TodoState copyWith({List<String>? todolist}) {
    return TodoState(todolist: todolist ?? this.todolist);
  }

  @override
  List<Object> get props => [todolist];
}

//final class TodoInitial extends TodoState {}
