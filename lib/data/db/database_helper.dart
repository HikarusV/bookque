import 'package:bookque/data/items.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblBookmark = 'bookmark';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/Book.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
                itemid TEXT PRIMARY KEY,
                title TEXT,
                imageid TEXT,
                author TEXT,
                shortdesc TEXT
               )     
            ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertBookmark(Items items) async {
    final db = await database;

    await db!.insert(_tblBookmark, items.toMap());
  }

  Future<List<Items>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblBookmark);
    print(results);

    return results.map((res) => Items.fromMap(res)).toList();
  }

  Future<Map> getBookmarkById(String itemid) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblBookmark,
      where: 'itemid = ?',
      whereArgs: [itemid],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeBookmark(String itemid) async {
    final db = await database;

    await db!.delete(
      _tblBookmark,
      where: 'itemid = ?',
      whereArgs: [itemid],
    );
  }
}
