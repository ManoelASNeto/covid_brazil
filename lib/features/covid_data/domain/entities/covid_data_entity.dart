import 'package:equatable/equatable.dart';

class CovidData extends Equatable {
  final String? uf;
  final String? state;
  final int? cases;
  final int? deaths;
  final int? suspects;

  const CovidData({this.uf, this.state, this.cases, this.deaths, this.suspects});

  @override
  List<Object?> get props => [
        uf,
        state,
        cases,
        deaths,
        suspects,
      ];
}
