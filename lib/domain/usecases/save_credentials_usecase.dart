import 'package:photos_app/data/datasources/local/auth_local_datasource.dart';

import '../models/Credentials.dart';

class SaveCredentialsUseCase {
  final AuthLocalDataSource _dataSource;

  SaveCredentialsUseCase(this._dataSource);

  @override
  Future<void> call(Credentials params) {
    return _dataSource.saveCredentials(params.email, params.password);
  }
}