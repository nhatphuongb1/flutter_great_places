import 'dart:io';

import 'package:flutter/cupertino.dart';

class Place {
  String id;
  String title;
  PlaceLocation location;
  File image;

  Place({this.id, this.title, this.location, this.image});

  Place.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.location = map['location'];
    this.image = map['image'];
    this.title = map['title'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imagePath': image.path,
    };
  }
}

class PlaceLocation {
  double latitude;
  double longitude;
  String address;

  PlaceLocation({this.latitude, this.longitude, this.address});

  PlaceLocation.fromMapObject(Map<String, dynamic> map) {
    this.latitude = map['latitude'];
    this.longitude = map['longitude'];
    this.address = map['address'];
  }

  Map<String, dynamic> toMap() {
    return {'latitude': latitude, 'longitude': longitude, 'address': address};
  }
}
