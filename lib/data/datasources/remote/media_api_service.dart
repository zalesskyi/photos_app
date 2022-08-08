import 'package:photos_app/data/datasources/remote/models/media_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'media_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class MediaApiService {

  factory MediaApiService(Dio dio, {String baseUrl}) = _MediaApiService;

  @GET("/albums")
  Future<HttpResponse<List<MediaResponse>>> getMedia();
}