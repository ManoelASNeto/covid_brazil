import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_brazil/core/errors/failures.dart';
import 'package:covid_brazil/core/utils/app_strings.dart';
import 'package:covid_brazil/features/covid_data/domain/usecases/get_covid_data.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'covid_data_state.dart';
part 'covid_data_event.dart';
part 'covid_data_bloc.freezed.dart';

class CovidDataBloc extends Bloc<CovidDataEvent, CovidDataState> {
  final GetCovidData getCovidData;

  CovidDataBloc(this.getCovidData) : super(const CovidDataState.initial());

  @override
  Stream<CovidDataState> mapEventToState(
    CovidDataEvent event,
  ) async* {
    yield* event.when(load: () async* {
      yield state.loading();
      var fold = await getCovidData();
      yield await fold.fold(
        (failure) => state.error(
          _mapCovidDataFailureToString(failure),
        ),
        (getCovidData) => state.ready(getCovidData),
      );
    });
  }

  String _mapCovidDataFailureToString(Failures failures) {
    return failures.maybeWhen(
      serverFailures: () => AppStrings.covidServerFailure,
      networkFailures: () => AppStrings.covidServerFailure,
      orElse: () => AppStrings.covidError,
    );
  }
}
