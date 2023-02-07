import 'dart:convert';

import 'package:flutter_ssi_challenge/models/character.dart';

class PeopleResponse {
  PeopleResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<Character> results;

  factory PeopleResponse.fromJson(String str) => PeopleResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeopleResponse.fromMap(Map<String, dynamic> json) => PeopleResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
