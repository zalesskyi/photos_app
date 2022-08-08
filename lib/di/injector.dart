import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:photos_app/data/datasources/local/app_database.dart';
import 'package:photos_app/data/datasources/local/auth_dao.dart';
import 'package:photos_app/data/datasources/local/auth_local_datasource.dart';
import 'package:photos_app/data/datasources/remote/media_api_service.dart';
import 'package:photos_app/data/datasources/remote/media_remote_datasource.dart';
import 'package:photos_app/domain/usecases/get_credentials_usecase.dart';
import 'package:photos_app/domain/usecases/get_media_usecase.dart';
import 'package:photos_app/domain/usecases/save_credentials_usecase.dart';
import 'package:photos_app/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:photos_app/presentation/screens/media/bloc/media_bloc.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  injector.registerSingleton<AuthDao>(database.authDao);

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<MediaApiService>(MediaApiService(injector()));

  injector.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl(injector<AuthDao>()));

  injector.registerSingleton<MediaRemoteDataSource>(MediaRemoteDataSourceImpl(injector<MediaApiService>()));

  injector.registerSingleton<SaveCredentialsUseCase>(SaveCredentialsUseCase(injector<AuthLocalDataSource>()));

  injector.registerSingleton<GetCredentialsUseCase>(GetCredentialsUseCase(injector<AuthLocalDataSource>()));

  injector.registerSingleton<GetMediaUseCase>(GetMediaUseCase(injector<MediaRemoteDataSource>()));

  injector.registerFactory(() => AuthBloc(injector.get(), injector.get()));

  injector.registerFactory(() => MediaBloc(injector.get()));
}

