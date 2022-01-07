import 'package:covid_brazil/core/errors/failures.dart';
import 'package:covid_brazil/core/errors/exception.dart';
import 'package:covid_brazil/features/covid_data/data/datasources/covid_data_remote_data_source.dart';
import 'package:covid_brazil/features/covid_data/domain/entities/covid_data_entity.dart';
import 'package:covid_brazil/features/covid_data/domain/repositories/i_covid_data_repository.dart';
import 'package:dartz/dartz.dart';

class CovidDataRepository implements ICovidDataRepository {
  final ICovidDataRemoteDataSource remoteDataSource;

  CovidDataRepository(this.remoteDataSource);

  @override
  Future<Either<Failures, List<CovidData>>> covidDataList() async {
    try {
      var covidDataListModel = await remoteDataSource.covidDataList();
      final entity = covidDataListModel.map((e) => e.toEntity()).toList();
      return Right(entity);
    } on NetworkException {
      return const Left(NetworkFailures());
    } on ServerException {
      return const Left(ServerFailures());
    }
  }
}
