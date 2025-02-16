import 'package:bloc_examples/bloc/bloc/posts_bloc.dart';
import 'package:bloc_examples/utils/enums.dart';
import 'package:bloc_examples/utils/enums.dart';
import 'package:bloc_examples/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<PostsBloc>().add(postfetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post screen'),
      ),
      body: Column(
        children: [
          BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
            switch (state.status) {
              case poststatus.loading:
                return CircularProgressIndicator();
              case poststatus.success:
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.postlist.length,
                      itemBuilder: (context, index) {
                        final item = state.postlist[index];
                        return ListTile(
                          title: Text(item.name.toString()),
                          subtitle: Text(item.email.toString()),
                        );
                      }),
                );
              case poststatus.failure:
                return Center(child: Text(state.message.toString()));
            }
          })
        ],
      ),
    );
  }
}
