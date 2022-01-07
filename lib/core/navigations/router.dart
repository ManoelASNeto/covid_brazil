import 'package:covid_brazil/core/navigations/routes.dart';
import 'package:covid_brazil/features/covid_data/presentation/bloc/covid_data_bloc.dart';
import 'package:covid_brazil/features/covid_data/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';

class AppRouter {
  final _covidDataBloc = sl<CovidDataBloc>();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _covidDataBloc..add(const CovidDataEvent.load()),
                  child: const HomePage(),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Erro'),
                  ),
                ));
    }
  }
}
