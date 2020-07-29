class DBConstants {
  static const DATABASE_NAME = "places.db";

  static const PLACES_TABLE_NAME = "places";
  static const CREATE_USER_PLACES_TABLE =
      "CREATE TABLE $PLACES_TABLE_NAME (id TEXT PRIMARY KEY, title  TEXT, imagePath TEXT, )";
}
