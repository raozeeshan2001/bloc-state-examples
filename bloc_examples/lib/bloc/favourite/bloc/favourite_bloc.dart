import 'package:bloc/bloc.dart';
import 'package:bloc_examples/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState()) {
    on<FavouriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
