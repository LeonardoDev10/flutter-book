import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:feiralivre/data/model/user.dart';

const String urlAPI = 'https://feiralivre.herokuapp.com/';
const String userTokenAPI = '';


List<User> parseShops(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List<User>> fetchCountries(http.Client client) async {
  final response = await client.get('$urlAPI/users');
  return compute(parseShops, response.body);
}

Future<User> fetchUser(String id) async {
  final response = await http.get('$urlAPI/users/1',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    });
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<User> createUser(User user) async {
  final response = await http.post('$urlAPI/users/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }));
  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<User> updateUser(User user) async {
  final http.Response response = await http.put('$urlAPI/user/${user.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(user),
  );
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

Future<User> deleteUser(String id) async {
  final http.Response response = await http.delete('$urlAPI/user/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    });
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete user.');
  }
}
