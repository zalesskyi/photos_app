import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:photos_app/domain/models/Credentials.dart';

@Entity(tableName: "Credentials")
class CredentialsEntity extends Equatable {

  @PrimaryKey(autoGenerate: true)
  final int id;
  final String email;
  final String password;

  const CredentialsEntity(this.id, this.email, this.password);

  @override
  List<Object> get props => [id, email, password];
}

extension CredentialsMapping on Credentials {

  CredentialsEntity toData() {
    return CredentialsEntity(0, email, password);
  }
}

extension CredentialsEntityMapping on CredentialsEntity {

  Credentials toDomain() {
    return Credentials(email, password);
  }
}