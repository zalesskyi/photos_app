import 'package:photos_app/domain/models/Credentials.dart';

import '../../data/datasources/local/auth_local_datasource.dart';

class GetCredentialsUseCase {
  final AuthLocalDataSource _dataSource;

  GetCredentialsUseCase(this._dataSource);

  @override
  Future<Credentials?> call() {
    return _dataSource.getCredentials();
  }
}