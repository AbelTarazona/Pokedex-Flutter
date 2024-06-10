import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_challenge/core/services/api_service.dart';
import 'package:pokemon_challenge/data/datasources/interfaces/i_main_remote_datasource.dart';
import 'package:pokemon_challenge/data/datasources/main_remote_datasource.dart';
import 'package:pokemon_challenge/data/repositories/main_repository.dart';
import 'package:pokemon_challenge/domain/repositories/i_main_repository.dart';

final GetIt getIt = GetIt.instance;

setupDiCore() async {
  getIt.registerLazySingleton<ChuckerHttpClient>(
      () => ChuckerHttpClient(http.Client()));

  getIt.registerLazySingleton<ApiService>(
      () => ApiService(client: getIt(), baseUrl: 'https://pokeapi.co/api/v2'));

  getIt.registerLazySingleton<IMainRemoteDatasource>(
      () => MainRemoteDatasource(apiService: getIt()));

  getIt.registerLazySingleton<IMainRepository>(
      () => MainRepository(mainRemoteDatasource: getIt()));
}
