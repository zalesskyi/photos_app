import 'package:floor/floor.dart';
import 'package:photos_app/data/datasources/local/auth_dao.dart';
import 'package:photos_app/data/datasources/local/models/credentials_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:path/path.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [CredentialsEntity])
abstract class AppDatabase extends FloorDatabase {
  AuthDao get authDao;
}
