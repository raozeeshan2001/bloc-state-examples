import 'package:bloc_examples/model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchitem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generatelist(10));
  }

  List<FavouriteItemModel> _generatelist(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(id: index.toString(), value: 'item $index'));
  }
}
