import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_great_places/constants/title_constants.dart';
import 'package:flutter_great_places/models/place.dart';
import 'package:flutter_great_places/providers/great_places.dart';
import 'package:flutter_great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlacePage extends StatefulWidget {
  AddPlacePage({Key key}) : super(key: key);

  static const routeName = "/add-place";

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {

    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TitleConstants.ADD_PLACE_PAGE),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                ImageInput(
                  onSelectImage: _selectImage,
                )
              ],
            ),
          )),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Add Place"),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
