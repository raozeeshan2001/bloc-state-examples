part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final poststatus status;
  final List<postmodel> postlist;
  final String message;
  const PostsState(
      {this.status = poststatus.loading,
      this.postlist = const <postmodel>[],
      this.message = ''});

  PostsState copyWith(
      {poststatus? status, List<postmodel>? postlist, String? message}) {
    return PostsState(
        status: status ?? this.status,
        postlist: postlist ?? this.postlist,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [status, postlist, message];
}
