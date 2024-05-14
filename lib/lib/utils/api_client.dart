import '../Models/user.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  Future<User> getUserById(int userId) async {
    try {
      final response = await http
          .get(Uri.parse('http://10.0.2.2:8000/api/user-data/$userId'));
      if (response.statusCode == 200) {
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return User.fromJson(jsonDecode(response.body));
      } else {
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch user data');
      }
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }

  Future<User> updateUserById(int userId, String name) async {
    final response = await http.put(
      Uri.parse('http://192.168.1.1:8000/api/user-data/$userId'),
      body: jsonEncode({'name': name}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user data');
    }
  }
}
