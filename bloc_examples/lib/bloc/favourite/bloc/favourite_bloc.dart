import 'package:bloc/bloc.dart';
import 'package:bloc_examples/model/favourite_item_model.dart';
import 'package:bloc_examples/repository/favourite_repository.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favlist = [];

  FavouriteBloc(this.favouriteRepository) : super(FavouriteState()) {
    on<fetchfavouritelist>(fetchlist);
  }
  void fetchlist(fetchfavouritelist event, Emitter<FavouriteState> emit) async {
    favlist = await favouriteRepository.fetchitem();
    emit(state.copyWith(
        favouriteitemslist: List.from(favlist),
        liststatus: liststatus.success));
  }
}
