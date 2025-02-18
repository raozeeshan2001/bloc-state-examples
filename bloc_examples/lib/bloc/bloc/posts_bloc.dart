import 'package:bloc/bloc.dart';
import 'package:bloc_examples/model/formmodel.dart';
import 'package:bloc_examples/model/postmodel.dart';
import 'package:bloc_examples/repository/formrepo.dart';
import 'package:bloc_examples/repository/post_repo.dart';
import 'package:bloc_examples/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<postmodel> modellist = [];
  List<Formmodel> formlist = [];
  PostRepo postrepo;
  Formrepo formrepo;
  PostsBloc(this.postrepo, this.formrepo) : super(PostsState()) {
    on<postfetched>(fetchpost);
    on<postform>(submitPost);
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

  void submitPost(postform event, Emitter<PostsState> emit) async {
    try {
      await formrepo.postdata(event.post);
      formlist.add(event.post);
      state.copyWith(
          status: poststatus.success,
          message: 'posted',
          postlist: List.from(formlist));
    } catch (e) {
      state.copyWith(message: e.toString());
    }
  }
}
