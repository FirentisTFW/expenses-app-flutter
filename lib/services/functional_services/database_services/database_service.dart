import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/functional_services/database_services/db_spec.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

class DatabaseService {
  final _migrationService = locator<DatabaseMigrationService>();
  late final Database _database;

  Database get database => _database;

  Future initialise() async {
    _database = await openDatabase(DbSpec.DB_NAME, version: 1);

    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_and_fill_category_table.sql',
        '2_create_expenditures_table.sql',
      ],
      verbose: true,
    );
  }
}
