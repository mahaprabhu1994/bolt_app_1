import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../api_constants.dart';
class ClientRepository {
  final String Url = ApiConstants.baseUrl;

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
          '$Url/listCustomersByAdviserId/$adviserId'
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