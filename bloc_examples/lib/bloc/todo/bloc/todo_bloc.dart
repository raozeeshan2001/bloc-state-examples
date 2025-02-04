import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<String> todolist = [];
  TodoBloc() : super(TodoState()) {
    on<addtodoevent>(_addtodoevent);
    on<removetodoevent>(_removetodoevent);
  }

  void _addtodoevent(addtodoevent event, Emitter<TodoState> emit) {
    todolist.add(event.task);
    emit(state.copyWith(todolist: List.from(todolist)));
  }

  void _removetodoevent(removetodoevent event, Emitter<TodoState> emit) {
    todolist.remove(event.task);
    emit(state.copyWith(todolist: List.from(todolist)));
  }
}
