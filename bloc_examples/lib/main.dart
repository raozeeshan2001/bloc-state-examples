import 'package:bloc_examples/bloc/Switch/switch_bloc.dart';
import 'package:bloc_examples/bloc/bloc/posts_bloc.dart';
import 'package:bloc_examples/bloc/counter/counter_bloc.dart';
import 'package:bloc_examples/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:bloc_examples/bloc/todo/bloc/todo_bloc.dart';
import 'package:bloc_examples/repository/favourite_repository.dart';
import 'package:bloc_examples/repository/formrepo.dart';
import 'package:bloc_examples/repository/post_repo.dart';
import 'package:bloc_examples/ui/counter_screen.dart';
import 'package:bloc_examples/ui/favourite_screen.dart';
import 'package:bloc_examples/ui/formscreen.dart';
import 'package:bloc_examples/ui/postscreen.dart';
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
          BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
          BlocProvider(create: (_) => PostsBloc(PostRepo(), Formrepo())),
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
          home: Formscreen(),
        ));
  }
}
