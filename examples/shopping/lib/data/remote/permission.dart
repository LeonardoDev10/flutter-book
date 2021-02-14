import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:feiralivre/data/model/permission.dart';

const String urlAPI = 'https://feiralivre.herokuapp.com/' + 'permissions';
const String userTokenAPI = '';

/// parse products in list
List<Permission> parsePermissions(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Permission>((json) => Permission.fromJson(json)).toList();
}

/// fetch product list
Future<List<Permission>> fetchPermissions(http.Client client) async {
  final response = await client.get('$urlAPI');
  return compute(parsePermissions, response.body);
}

/// fetch a product
Future<Permission> fetchPermission(String id) async {
  final response = await http.get('$urlAPI/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Permission.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load permission');
  }
}

/// insert a product
Future<Permission> createPermission(Permission permission) async {
  final response = await http.post('$urlAPI',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      },
      body: jsonEncode(permission));
  if (response.statusCode == 201) {
    return Permission.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create permission.');
  }
}

/// update a product
Future<Permission> updatePermission(Permission permission) async {
  final http.Response response = await http.put('$urlAPI/permission/${permission.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(permission),
  );
  if (response.statusCode == 200) {
    return Permission.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}

/// delete a product
Future<Permission> deletePermission(String id) async {
  final http.Response response = await http.delete('$urlAPI/permisison/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Permission.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete permission.');
  }
}
