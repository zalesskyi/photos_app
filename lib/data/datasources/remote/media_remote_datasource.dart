import 'package:photos_app/data/datasources/remote/media_api_service.dart';
import 'package:photos_app/data/datasources/remote/models/media_response.dart';

abstract class MediaRemoteDataSource {

  Future<List<MediaResponse>> getMedia();
}

class MediaRemoteDataSourceImpl extends MediaRemoteDataSource {

  MediaApiService _apiService;

  MediaRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<MediaResponse>> getMedia() {
    return _apiService.getMedia().then((value) => value.data);
  }
}