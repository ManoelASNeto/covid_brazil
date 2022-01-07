part of 'covid_data_bloc.dart';

@freezed
class CovidDataEvent with _$CovidDataEvent {
  const factory CovidDataEvent.load() = _Load;
}
