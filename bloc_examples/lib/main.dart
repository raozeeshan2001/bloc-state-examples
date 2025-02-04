import 'package:bloc_examples/bloc/Switch/switch_bloc.dart';
import 'package:bloc_examples/bloc/counter/counter_bloc.dart';
import 'package:bloc_examples/bloc/todo/bloc/todo_bloc.dart';
import 'package:bloc_examples/ui/counter_screen.dart';
import 'package:bloc_examples/ui/favourite_screen.dart';
import 'package:bloc_examples/ui/switch_screen.dart';
import 'package:bloc_examples/ui/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => TodoBloc()),
        ],
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          title: 'Flutter Demo',
          darkTheme: ThemeData(
            brightness: Brightness.dark, // Ensure dark theme
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness:
                  Brightness.dark, // This must match ThemeData.brightness
            ),
            useMaterial3: true,
          ),
          home: FavouriteScreen(),
        ));
  }
}
