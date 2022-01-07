import 'package:covid_brazil/core/errors/failures.dart';
import 'package:covid_brazil/features/covid_data/domain/entities/covid_data_entity.dart';
import 'package:covid_brazil/features/covid_data/domain/repositories/i_covid_data_repository.dart';
import 'package:dartz/dartz.dart';

class GetCovidData {
  final ICovidDataRepository repository;

  GetCovidData(this.repository);

  Future<Either<Failures, List<CovidData>>> call() async {
    return await repository.covidDataList();
  }
}
