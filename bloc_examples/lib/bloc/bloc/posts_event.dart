part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class postfetched extends PostsEvent {}

class postform extends PostsEvent {
  final Formmodel post;

  postform(this.post);

  @override
  List<Object> get props => [post];
}
