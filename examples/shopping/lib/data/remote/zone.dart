import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:feiralivre/data/model/address.dart';

const String urlAPI = 'https://feiralivre.herokuapp.com/';
const String userTokenAPI = '';

/// parse products in list
List<Zone> parseZones(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Zone>((json) => Zone.fromJson(json)).toList();
}

/// fetch product list
Future<List<Zone>> getZones(http.Client client) async {
  final response = await client.get('$urlAPI/zones');
  return compute(parseZones, response.body);
}

/// fetch a product
Future<Zone> getZone(String id) async {
  final response = await http.get('$urlAPI/zone/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Zone.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

/// insert a product
Future<Zone> postProduct(Zone zone) async {
  final response = await http.post('$urlAPI/zone/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      },
      body: jsonEncode(zone));
  if (response.statusCode == 201) {
    return Zone.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create zone.');
  }
}

/// update a product
Future<Zone> putZone(Zone zone) async {
  final http.Response response = await http.put('$urlAPI/zone/${zone.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(zone),
  );
  if (response.statusCode == 200) {
    return Zone.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load zone');
  }
}

/// delete a zone
Future<Zone> deleteZone(String id) async {
  final http.Response response = await http.delete('$urlAPI/zone/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Zone.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete zone.');
  }
}
