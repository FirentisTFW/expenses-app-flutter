import 'package:Expenses_app/app/locator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

const String DB_NAME = 'expenditures_database.sqflite';

class DatabaseService {
  final _migrationService = locator<DatabaseMigrationService>();
  Database _database;

  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_and_fill_category_table.sql',
      ],
      verbose: true,
    );
  }
}
