import 'package:photos_app/data/datasources/local/auth_dao.dart';
import 'package:photos_app/data/datasources/local/models/credentials_entity.dart';

import '../../../domain/models/Credentials.dart';

abstract class AuthLocalDataSource {

  Future<void> saveCredentials(String email, String password);

  Future<Credentials?> getCredentials();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {

  final AuthDao _dao;

  AuthLocalDataSourceImpl(this._dao);

  @override
  Future<Credentials?> getCredentials() async {
    return _dao.getCredentials()
        .then((value) => value.isNotEmpty ? value.first : null)
        .then((value) => value?.toDomain());
  }

  @override
  Future<void> saveCredentials(String email, String password) {
    return _dao.saveCredentials(CredentialsEntity(0, email, password));
  }
}