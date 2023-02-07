import 'package:dio/dio.dart';
import 'package:flutter_ssi_challenge/models/people_response.dart';

class Swapi {
  final Dio _dio = Dio();
  final String _baseSwapiUrl = "https://swapi.dev/api";

  Future<PeopleResponse> getPeople({String? nextOrPreviousPeopleUrl}) async {
    const String path = '/people';
    var response = await _dio.get(nextOrPreviousPeopleUrl ?? (_baseSwapiUrl + path));
    final PeopleResponse people = PeopleResponse.fromMap(response.data);
    return people;
  }
}
