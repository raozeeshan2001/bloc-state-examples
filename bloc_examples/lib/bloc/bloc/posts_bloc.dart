import 'package:bloc/bloc.dart';
import 'package:bloc_examples/model/postmodel.dart';
import 'package:bloc_examples/repository/post_repo.dart';
import 'package:bloc_examples/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<postmodel> modellist = [];
  PostRepo postrepo;
  PostsBloc(this.postrepo) : super(PostsState()) {
    on<postfetched>(fetchpost);
  }

  void fetchpost(postfetched event, Emitter<PostsState> emit) async {
    try {
      modellist = await postrepo.fetchpost();
      emit(state.copyWith(
          postlist: List.from(modellist),
          message: 'success',
          status: poststatus.success));
    } catch (e) {
      emit(state.copyWith(status: poststatus.failure, message: e.toString()));
    }
  }
}
