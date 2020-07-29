import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_great_places/constants/db_constants.dart';
import 'package:flutter_great_places/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        image: pickedImage,
        location: null);

    _items.add(newPlace);
    notifyListeners();
    var map = newPlace.toMap();
    LocalDBHelper.insert(DBConstants.PLACES_TABLE_NAME, map);
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await LocalDBHelper.getData(DBConstants.PLACES_TABLE_NAME);

    _items = dataList
        .map((item) => Place(
            id: item['id'],
            location: item['location'],
            title: item['title'],
            image: File(item['imagePath'])))
        .toList();
  }
}
