import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_riverpod/models/cat_fact.dart';

class CatFactService {
  final String _baseUrl = 'https://catfact.ninja/fact';
  final String _multipleFactsUrl = 'https://catfact.ninja/facts';

  Future<CatFact> fetchCatFact() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        return CatFact.fromJson(json.decode(response.body));
      } else {
        throw Exception(
          'Fail to load: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<CatFact>> fetchCatFacts() async {
    try {
      final response = await http.get(Uri.parse(_multipleFactsUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> factsJson = jsonResponse['data'];
        return factsJson.map((json) => CatFact.fromJson(json)).toList();
      } else {
        throw Exception(
          'Fail to load: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
