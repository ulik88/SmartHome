/* import 'dart:convert';
import 'package:smart_home/data/appliances.dart';

import 'package:http/http.dart' as http;

class ApplianceProvider {
  Future<List<Appliance>> getAppliance() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> applienceJson = json.decode(response.body);
      return applienceJson.map((json) => Appliance.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching aplliences');
    }
  }
}
 
















/*  import 'dart:convert';
import 'package:smart_home/data/appliances.dart';

import 'package:http/http.dart' as http;

class ApplianceProvider {
  Future<List<Appliance>> getAppliance() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> applienceJson = json.decode(response.body);
      return applienceJson.map((json) => Appliance.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching aplliences');
    }
  }
}
  */ */