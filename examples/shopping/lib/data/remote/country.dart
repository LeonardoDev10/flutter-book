import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:feiralivre/data/model/address.dart';

const String urlAPI = 'https://feiralivre.herokuapp.com/';
const String userTokenAPI = '';

List<Country> parseCountries(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Country>((json) => Country.fromJson(json)).toList();
}

Future<List<Country>> fetchCountries(http.Client client) async {
  final response = await client.get('$urlAPI/countries');
  return compute(parseCountries, response.body);
}

Future<Country> fetchCountry(String id) async {
  final response = await http.get('$urlAPI/countries/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Country.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Country> createUser(String title) async {
  final response = await http.post('$urlAPI/countries/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }));
  if (response.statusCode == 201) {
    return Country.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<Country> updateCountry(String title) async {
  final http.Response response = await http.put('$urlAPI/countries',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  if (response.statusCode == 200) {
    return Country.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Country> deleteCountry(String id) async {
  final http.Response response = await http.delete(
      '$urlAPI/countries/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Country.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}
