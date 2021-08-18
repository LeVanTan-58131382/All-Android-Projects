import 'package:learning_english_with_getx/core/models/image_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonalVocabularyDatabase {
  static final PersonalVocabularyDatabase instance =
      PersonalVocabularyDatabase._init();

  static Database? _database;

  PersonalVocabularyDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('personalVocabulary.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE images ( 
        word_id $integerType,
        image $textType
        )
      ''');
  }

  Future<void> create(Image image) async {
    final db = await instance.database;

    // await db.insert("images", image.toJson());
    await db.insert("images", {"word_id": image.wordId, "image": image.image});
    //return image.copy(id: id);
  }

  Future<Image> readImage(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      "images",
      columns: ["id", "image", "word_id"],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Image.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Image>> readAllImages() async {
    final db = await instance.database;

    final result = await db.query("images");

    print(result.map((json) => Image.fromJson(json)).toList().runtimeType);

    return result.map((json) => Image.fromJson(json)).toList();
  }

  Future<List<Image>> readImagesByCondition(int wordId) async {
    final db = await instance.database;

    final result = await db.query(
      "images",
      columns: ["image", "word_id"],
      where: 'word_id = ?',
      whereArgs: [wordId],
    );

    if (result.isNotEmpty) {
      return result.map((json) => Image.fromJson(json)).toList();
    } else {
      throw Exception('ID $wordId not found');
    }
  }

  Future<int> delete(int wordId) async {
    final db = await instance.database;

    return await db.delete(
      "images",
      where: 'id = ?',
      whereArgs: [wordId],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
