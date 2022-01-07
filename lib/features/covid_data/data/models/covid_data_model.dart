import 'package:covid_brazil/features/covid_data/domain/entities/covid_data_entity.dart';
import 'package:equatable/equatable.dart';

class CovidDataModel extends Equatable {
  final String? uf;
  final String? state;
  final int? cases;
  final int? deaths;
  final int? suspects;

  const CovidDataModel({
    this.uf,
    this.state,
    this.cases,
    this.deaths,
    this.suspects,
  });

  @override
  List<Object?> get props => [
        uf,
        state,
        cases,
        deaths,
        suspects,
      ];

  factory CovidDataModel.fromJson(Map<String, dynamic> json) => CovidDataModel(
        uf: json['uf'],
        state: json['state'],
        cases: json['cases'],
        deaths: json['deaths'],
        suspects: json['suspects'],
      );

  factory CovidDataModel.fronEntity(CovidData entity) => CovidDataModel(
        uf: entity.uf,
        state: entity.state,
        cases: entity.cases,
        deaths: entity.deaths,
        suspects: entity.suspects,
      );

  CovidData toEntity() => CovidData(
        uf: uf,
        state: state,
        cases: cases,
        deaths: deaths,
        suspects: suspects,
      );
}
