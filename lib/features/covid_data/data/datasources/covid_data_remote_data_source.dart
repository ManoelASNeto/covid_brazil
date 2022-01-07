import 'dart:convert';

import 'package:covid_brazil/core/errors/exception.dart';
import 'package:covid_brazil/core/utils/endpoints.dart';
import 'package:http/http.dart' as http;

import 'package:covid_brazil/core/device/network_info.dart';
import 'package:covid_brazil/features/covid_data/data/models/covid_data_model.dart';

abstract class ICovidDataRemoteDataSource {
  Future<List<CovidDataModel>> covidDataList();
}

class CovidDataRemoteDataSource implements ICovidDataRemoteDataSource {
  final client = http.Client();
  final urlBrazil = Uri.parse((Endpoints.url + Endpoints.brazil));
  final INetworkInfo networkInfo;

  CovidDataRemoteDataSource(
    this.networkInfo,
  );

  @override
  Future<List<CovidDataModel>> covidDataList() async {
    if (await networkInfo.isConnected) {
      final response = await client.get(urlBrazil);
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          final covidDataList = responseJson['data'] as List;
          return covidDataList.map((e) => CovidDataModel.fromJson(e)).toList();
        default:
          throw const ServerException();
      }
    } else {
      throw const NetworkException();
    }
  }
}
