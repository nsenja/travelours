// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'pemasukan.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE pemasukan (
            id INTEGER PRIMARY KEY,
            tanggal TEXT,
            jumlah REAL,
            keterangan TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertPemasukan(Map<String, dynamic> pemasukan) async {
    final db = await database;
    return await db.insert('pemasukan', pemasukan);
  }

  insertPengeluaran(Map<String, Object> pengeluaran) {}

  // Tambahkan metode lain sesuai kebutuhan (baca, perbarui, hapus).
}
