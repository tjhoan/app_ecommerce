import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/customer.dart';

// Servicio para realizar peticiones a la API, para el registro de usuarios
class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  // Método para registrar un nuevo usuario
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
      return Customer.fromJson(jsonDecode(
          response.body)['customer']); // Retornamos el usuario registrado
    } else {
      // Error en el registro, capturamos el mensaje de error
      final responseData = jsonDecode(response.body);
      final errorMessage =
          responseData['message'] ?? 'Error al registrar el usuario';
      throw Exception(errorMessage);
    }
  }

  // Método para iniciar sesión
  Future<Customer?> loginCustomer(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login exitoso
      return Customer.fromJson(jsonDecode(response.body)[
          'customer']); // Asegúrate que Laravel retorne el usuario
    } else {
      // Error en el login
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['message'] ?? 'Error al iniciar sesión';
      throw Exception(errorMessage);
    }
  }
}
