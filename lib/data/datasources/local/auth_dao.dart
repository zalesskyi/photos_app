import 'package:floor/floor.dart';

import 'models/credentials_entity.dart';

@dao
abstract class AuthDao {

  @Query("SELECT * FROM Credentials")
  Future<List<CredentialsEntity>> getCredentials();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveCredentials(CredentialsEntity creds);
}