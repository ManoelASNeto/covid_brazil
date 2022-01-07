import 'package:covid_brazil/features/covid_data/domain/entities/covid_data_entity.dart';
import 'package:equatable/equatable.dart';

enum CovidDataStatus {
  loading,
  ready,
  error,
}

class CovidDataState extends Equatable {
  final CovidDataStatus? status;
  final List<CovidData>? covidData;
  final String? message;

  const CovidDataState._(this.status, this.covidData, this.message);

  const CovidDataState.initial() : this._(CovidDataStatus.loading, null, null);

  CovidDataState loading() {
    return CovidDataState._(CovidDataStatus.loading, covidData, message);
  }

  CovidDataState ready(List<CovidData>? covidData) {
    return CovidDataState._(CovidDataStatus.ready, covidData, message);
  }

  CovidDataState error(String? msgError) {
    return CovidDataState._(CovidDataStatus.error, covidData, msgError);
  }

  @override
  List<Object?> get props => [
        status,
        covidData,
        message,
      ];
}
