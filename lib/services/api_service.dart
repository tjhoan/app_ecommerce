import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/customer.dart';

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  Future<Customer?> registerCustomer(
      String firstName, String lastName, String email, String password) async {
    final url = Uri.parse('$_baseUrl/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'password_confirmation': password,
      }),
    );

    if (response.statusCode == 201) {
      // Registro exitoso
      return Customer.fromJson(jsonDecode(response.body)['customer']);
    } else {
      // Error en el registro, capturamos el mensaje de error
      final responseData = jsonDecode(response.body);
      final errorMessage =
          responseData['message'] ?? 'Error al registrar el usuario';
      throw Exception(errorMessage);
    }
  }
}
