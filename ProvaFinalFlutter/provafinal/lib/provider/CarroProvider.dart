import 'package:provafinal/provider/DatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';

class CarroProvider extends DatabaseProvider {
  static final table = "CARROS";
  static final columnId = "_id";
  static final columnMarca = "marca";
  static final columnAnoFabricacao = "anoFabricacao";
  static final columnPlaca = "placa";
  static final columnValorRevenda = "valorRevenda";

  // String create =

  CarroProvider()
      : super(
            sql:
                "CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnMarca TEXT NOT NULL, $columnAnoFabricacao TEXT, $columnPlaca TEXT,$columnValorRevenda TEXT)");

  //CRUD
  Future<int> insert(Map<String, dynamic> linha) async {
    Database? db = await super.database;
    return await db!.insert(table, linha);
  }

  Future<List<Map<String, dynamic>>> selectAll() async {
    Database? db = await super.database;
    return db!.query(table);
  }

  //UPDATE
  Future<int> update(Map<String, dynamic> linha) async {
    Database? db = await super.database;
    int id = linha[columnId];
    return await db!
        .update(table, linha, where: "$columnId = ?", whereArgs: [id]);
  }

  //DELETE
  Future<int> delete(int id) async {
    Database? db = await super.database;
    return await db!.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }

  //executar comados personalizados no banco da dados
  //COUNT()
  Future<int?> selectCountAll() async {
    Database? db = await super.database;
    return Sqflite.firstIntValue(
      await db!.rawQuery("SELECT COUNT($columnId) FROM $table"),
    );
  }

  Future<int?> queryRowCount() async {
    Database? db = await super.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }
}
