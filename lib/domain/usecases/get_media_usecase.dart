
import 'package:photos_app/data/datasources/remote/media_remote_datasource.dart';
import 'package:photos_app/data/datasources/remote/models/media_response.dart';

class GetMediaUseCase {

  final MediaRemoteDataSource dataSource;

  GetMediaUseCase(this.dataSource);

  @override
  Future<List<MediaResponse>> call() {
    return dataSource.getMedia();
  }
}