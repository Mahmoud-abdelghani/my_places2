import 'package:my_places/models/place_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static Future<Database> initialize() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'places.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE places(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            image TEXT,
            lat REAL,
            lng REAL,
            category TEXT,
            date TEXT
          )
        ''');
      },
    );
  }

  static Database? database;
  static Future<Database?> getDatabase() async {
    database ??= await initialize();
    return database;
  }

  static Future<void> insertPlace(PlaceModel place) async {
    Database? db = await getDatabase();

    await db!.insert('places', {
      'title': place.title,
      'description': place.description,
      'image': place.imagePath,
      'lat': place.latitude,
      'lng': place.longitude,
      'date': place.date.toIso8601String(),
      'category': place.category,
    });
  }

  static Future<List<PlaceModel>> getPlaces() async {
    Database? db = await getDatabase();
    final List<Map<String, Object?>> places = await db!.query('places');
    return places.map((e) {
      return PlaceModel(
        id:( e['id'] as int).toString(),
        category: e['category'] as String,
        title: e['title'] as String,
        description: e['description'] as String,
        imagePath: e['image'] as String,
        latitude: e['lat'] as double,
        longitude: e['lng'] as double,
        date: DateTime.parse(e['date'] as String),
      );
    }).toList();
  }

  static Future<void> deletePlace(int id) async {
    Database? db = await getDatabase();
    await db!.delete('places', where: 'id=?', whereArgs: [id]);
  }

  static Future<void> updatePlace(PlaceModel place) async {
    Database? db = await getDatabase();
    await db!.update(
      'places',
      {
        'title': place.title,
        'description': place.description,
        'image': place.imagePath,
        'lat': place.latitude,
        'lng': place.longitude,
        'date': place.date.toIso8601String(),
      },
      where: 'id=?',
      whereArgs: [place.id],
    );
  }
}
