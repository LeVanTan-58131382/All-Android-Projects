import 'package:learning_english/models/word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WordDatabase {
  static final WordDatabase instance =
  WordDatabase._init();

  static Database? _database;

  WordDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('words.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableWords (
  ${WordFields.id} $idType, 
  ${WordFields.word} $textType,
  ${WordFields.pronounce} $textType,
  ${WordFields.mean} $textType,
  ${WordFields.partOfSpeech} $textType)
''');
  }

  Future<Word> create(
      Word word) async {
    final db = await instance.database;

    final id = await db.insert(
        tableWords, word.toJson());
    return word.copy(id: id);
  }

  Future<Word> readWord(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWords,
      columns: WordFields.values,
      where: '${WordFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Word.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Word>> readWords() async {
    final db = await instance.database;

    final orderBy = '${WordFields.id} ASC';

    final result =
    await db.query(tableWords, orderBy: orderBy);

    print(result
        .map((json) => Word.fromJson(json))
        .toList()
        .runtimeType);

    return result.map((json) => Word.fromJson(json)).toList();
  }

  // Future<List<Word>> readWordByCondition(
  //     String nameCondition, dynamic valueCondition) async {
  //   final db = await instance.database;
  //
  //   final result = await db.query(
  //     tableWords,
  //     columns: WordFields.values,
  //     //where: '${UnitKnowledgePersonalFields.id} = ?',
  //     where: await buildWhere(nameCondition),
  //     whereArgs: [valueCondition],
  //   );
  //
  //   if (result.isNotEmpty) {
  //     return result
  //         .map((json) => Word.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('ID $valueCondition not found');
  //   }
  // }

  Future<int> update(Word word) async {
    final db = await instance.database;

    return db.update(
      tableWords,
      word.toJson(),
      where: '${WordFields.id} = ?',
      whereArgs: [word.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableWords,
      where: '${WordFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  // Future<String> buildWhere(String nameCondition) async {
  //   switch (nameCondition) {
  //     case "isImportant":
  //       {
  //         return '${WordFields.isImportant} = ?';
  //         break;
  //       }
  //     case "number":
  //       {
  //         return '${WordFields.number} = ?';
  //         break;
  //       }
  //     case "saveToCloud":
  //       {
  //         return '${WordFields.saveToCloud} = ?';
  //         break;
  //       }
  //     case "achieved":
  //       {
  //         return '${UnitKnowledgePersonalFields.achieved} = ?';
  //         break;
  //       }
  //   }
  //   return "";
  // }
}
