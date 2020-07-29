import 'package:flutter/material.dart';
import 'package:flutter_great_places/constants/message_constants.dart';
import 'package:flutter_great_places/constants/title_constants.dart';
import 'add_place_page.dart';

import 'package:provider/provider.dart';
import 'package:flutter_great_places/providers/great_places.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(TitleConstants.PLACES_LIST_PAGE),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlacePage.routeName);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: Center(
                        child: Text(MessageConstants.PLACES_DATA_IS_EMPTY),
                      ),
                      builder: (context, greatPlaces, child) =>
                          greatPlaces.items.length <= 0
                              ? child
                              : ListView.builder(
                                  itemCount: greatPlaces.items.length,
                                  itemBuilder: (ctx, i) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          FileImage(greatPlaces.items[i].image),
                                    ),
                                    title: Text(greatPlaces.items[i].title),
                                  ),
                                )),
        ));
  }
}
