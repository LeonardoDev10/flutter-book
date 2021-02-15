import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String urlAPI = 'https://feiralivre.herokuapp.com/';
const String userTokenAPI = '';

/// parse doc list
List<T> parseDocs(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<T>((json) => T.fromJson(json)).toList();
}

/// fetch doc list
Future<List<T>> getDocs(http.Client client) async {
  final response = await client.get('$urlAPI');
  return compute(parseDocs, response.body);
}

/// fetch a doc
Future<T> getDoc(String id) async {
  final response = await http.get('$urlAPI/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return T.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to request get doc.');
  }
}

/// insert a doc
Future<T> postDoc(T doc) async {
  final response = await http.post('$urlAPI/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      },
      body: jsonEncode(doc));
  if (response.statusCode == 201) {
    return T.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to request post doc.');
  }
}

/// update a doc
Future<T> putDoc(T doc) async {
  final http.Response response = await http.put('$urlAPI/${doc.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: userTokenAPI
    },
    body: jsonEncode(doc),
  );
  if (response.statusCode == 200) {
    return T.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to request put doc.');
  }
}

/// delete a doc
Future<T> deleteDoc(String id) async {
  final http.Response response = await http.delete('$urlAPI/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: userTokenAPI
      });
  if (response.statusCode == 200) {
    return T.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete doc.');
  }
}
