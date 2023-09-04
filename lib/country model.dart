// To parse this JSON data, do
//
//     final countryDet = countryDetFromJson(jsonString);

import 'dart:convert';

CountryDet countryDetFromJson(String str) => CountryDet.fromJson(json.decode(str));

String countryDetToJson(CountryDet data) => json.encode(data.toJson());

class CountryDet {
  String name;
  String flag;
  String iso2;
  String iso3;

  CountryDet({
    required this.name,
    required this.flag,
    required this.iso2,
    required this.iso3,
  });

  factory CountryDet.fromJson(Map<String, dynamic> json) => CountryDet(
    name: json["name"],
    flag: json["flag"],
    iso2: json["iso2"],
    iso3: json["iso3"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flag": flag,
    "iso2": iso2,
    "iso3": iso3,
  };
}
