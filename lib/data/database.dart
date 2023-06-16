import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
import "package:app_alarme/data/alarme_dao.dart";

Future<Database> getDatabase() async {
  final String path = join(
    await getDatabasesPath(),
    "app_alarme_db.db",
  );
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(AlarmeDao.tabelaSql);
    },
    version: 1,
  );
}
