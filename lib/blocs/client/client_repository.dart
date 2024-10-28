import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientRepository {
  final String baseUrl = 'http://192.168.1.117:8080/FPMSSERVICE';

  Future<Map<String, dynamic>> fetchClients({
    required String adviserId,
    int page = 0,
    int size = 10,
    Map<String, dynamic>? filters,
    String? globalSearch,
    List<Map<String, String>>? sorting,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'size': size.toString(),
        'filters': jsonEncode(filters ?? {}),
        'globalSearch': globalSearch ?? '',
        'sorting': jsonEncode(sorting ?? []),
      };

      final uri = Uri.parse(
          '$baseUrl/listCustomersByAdviserId/$adviserId'
      ).replace(queryParameters: queryParams);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch clients');
      }
    } catch (e) {
      throw Exception('Error fetching clients: $e');
    }
  }
}