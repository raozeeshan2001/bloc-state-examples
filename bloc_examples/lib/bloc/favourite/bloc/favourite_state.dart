part of 'favourite_bloc.dart';

enum liststatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteitemslist;
  final liststatus status;
  const FavouriteState(
      {this.favouriteitemslist = const [], this.status = liststatus.loading});

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favouriteitemslist, liststatus}) {
    return FavouriteState(
        favouriteitemslist: favouriteitemslist ?? this.favouriteitemslist,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [favouriteitemslist, status];
}

//final class FavouriteInitial extends FavouriteState {}
