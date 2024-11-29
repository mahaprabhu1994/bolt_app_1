
// services/api_service.dart
import 'package:avallis/modal/fna_approval.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
class ApiService {
  final String baseUrl = 'https://uatapps.avallis.com/FPMSSERVICE';

  Future<List<FnaApproval>> getFnaApprovalList(String advisorId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/fnaApproval/getMgrFnaApprovalList/$advisorId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => FnaApproval.fromJson(json)).toList();
      }
      throw Exception('Failed to load approvals');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool> approveFna(String fnaId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/fnaApproval/approve/$fnaId'),
      );
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error approving FNA: $e');
    }
  }

  Future<bool> rejectFna(String fnaId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/fnaApproval/reject/$fnaId'),
      );
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error rejecting FNA: $e');
    }
  }
}