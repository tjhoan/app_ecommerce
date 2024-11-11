// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/customer.dart';
import '../utils/error_handler.dart';

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  // Método para registrar un nuevo usuario
  Future<Customer?> registerCustomer(
      String firstName, String lastName, String email, String password) async {
    final url =
        Uri.parse('$_baseUrl/register'); // Ruta corregida para el registro

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'password': password,
              'password_confirmation': password,
            }),
          )
          .timeout(
              const Duration(seconds: 10)); // Límite de tiempo de 10 segundos

      if (response.statusCode == 201) {
        // Registro exitoso
        print("Registro exitoso: ${response.body}");
        return Customer.fromJson(jsonDecode(response.body)['customer']);
      } else {
        // Error en el registro
        print(
            "Error en el registro - Código de estado: ${response.statusCode}");
        print("Respuesta: ${response.body}");
        throw Exception(ErrorHandler.handleHttpError(response.statusCode));
      }
    } on TimeoutException catch (e) {
      print("TimeoutException: $e");
      throw Exception(ErrorHandler.handleNetworkError(e));
    } on SocketException catch (e) {
      print("SocketException: $e");
      throw Exception(ErrorHandler.handleNetworkError(e));
    } catch (error) {
      print("Unexpected Error in registerCustomer: $error");
      throw Exception(ErrorHandler.handleNetworkError(error));
    }
  }

  // Método para iniciar sesión
  Future<Customer?> loginCustomer(String email, String password) async {
    final url =
        Uri.parse('$_baseUrl/login'); // Ruta corregida para el login

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'password': password,
            }),
          )
          .timeout(
              const Duration(seconds: 10)); // Límite de tiempo de 10 segundos

      if (response.statusCode == 200) {
        // Login exitoso
        print("Login exitoso: ${response.body}");
        return Customer.fromJson(jsonDecode(response.body)['customer']);
      } else {
        // Error en el login
        print("Error en el login - Código de estado: ${response.statusCode}");
        print("Respuesta: ${response.body}");
        throw Exception(ErrorHandler.handleHttpError(response.statusCode));
      }
    } on TimeoutException catch (e) {
      print("TimeoutException: $e");
      throw Exception(ErrorHandler.handleNetworkError(e));
    } on SocketException catch (e) {
      print("SocketException: $e");
      throw Exception(ErrorHandler.handleNetworkError(e));
    } catch (error) {
      print("Unexpected Error in loginCustomer: $error");
      throw Exception(ErrorHandler.handleNetworkError(error));
    }
  }
}
