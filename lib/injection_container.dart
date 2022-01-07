import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:covid_brazil/core/device/network_info.dart';
import 'package:covid_brazil/features/covid_data/data/datasources/covid_data_remote_data_source.dart';
import 'package:covid_brazil/features/covid_data/data/repositories/covid_data_repository.dart';
import 'package:covid_brazil/features/covid_data/domain/repositories/i_covid_data_repository.dart';
import 'package:covid_brazil/features/covid_data/domain/usecases/get_covid_data.dart';
import 'package:covid_brazil/features/covid_data/presentation/bloc/covid_data_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => CovidDataBloc(sl()));
  sl.registerLazySingleton(() => GetCovidData(sl()));
  sl.registerLazySingleton<ICovidDataRepository>(() => CovidDataRepository(sl()));
  sl.registerLazySingleton<ICovidDataRemoteDataSource>(() => CovidDataRemoteDataSource(sl()));

  await sl.allReady();
}
