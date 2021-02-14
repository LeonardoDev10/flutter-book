import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:feiralivre/data/model/shop.dart';

const String urlAPI = 'https://feiralivre.herokuapp.com/';
const String userTokenAPI = '';

List<Shop> parseShops(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Shop>((json) => Shop.fromJson(json)).toList();
}

Future<List<Shop>> getShops(http.Client client) async {
  final response = await client.get('$urlAPI/shops');
  return compute(parseShops, response.body);
}

Future<Shop> getShop(String id) async {
  final response = await http.get('$urlAPI/shop/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Shop.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Shop> postShop(Shop shop) async {
  final response = await http.post('$urlAPI/shop/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      },
      body: jsonEncode(shop));
  if (response.statusCode == 201) {
    return Shop.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create shop.');
  }
}

Future<Shop> putShop(Shop shop) async {
  final http.Response response = await http.put('$urlAPI/shop/${shop.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(shop),
  );
  if (response.statusCode == 200) {
    return Shop.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Shop> deleteShop(String id) async {
  final http.Response response = await http.delete('$urlAPI/shops/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return Shop.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}
