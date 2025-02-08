import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  String id;
  String value;
  bool isdeleting;
  bool isfavourite;

  FavouriteItemModel(
      {required this.id,
      required this.value,
      this.isdeleting = false,
      this.isfavourite = false});

  FavouriteItemModel copyWith(
      {String? id, String? value, bool? isdeleting, bool? isfavourite}) {
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isdeleting: isdeleting ?? this.isdeleting,
        isfavourite: isfavourite ?? this.isfavourite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isdeleting, isfavourite];
}
