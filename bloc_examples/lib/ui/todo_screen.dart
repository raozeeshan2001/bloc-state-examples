import 'package:bloc_examples/bloc/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo Screen'),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, State) {
                  if (State.todolist.isEmpty) {
                    return Center(
                      child: Text('no data found'),
                    );
                  } else if (State.todolist.isNotEmpty) {
                    return ListView.builder(
                        itemCount: State.todolist.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(State.todolist[index]),
                            trailing: IconButton(
                                onPressed: () {
                                  context.read<TodoBloc>().add(removetodoevent(
                                      task: State.todolist[index]));
                                },
                                icon: Icon(Icons.delete)),
                          );
                        });
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
                onPressed: () {
                  for (int i = 0; i < 5; i++) {
                    context
                        .read<TodoBloc>()
                        .add(addtodoevent(task: 'task: ' + i.toString()));
                  }
                })
          ],
        ),
      ),
    );
  }
}
