import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/add_place_page.dart';
import 'pages/places_list_page.dart';
import 'providers/great_places.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: "Great Places",
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlacesListPage(),
        routes: {AddPlacePage.routeName: (context) => AddPlacePage()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
