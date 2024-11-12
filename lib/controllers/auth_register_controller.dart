// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:project_s6_mobile/screens/home_screen.dart';
import '../services/api_service.dart';
import '../models/customer.dart';

class AuthRegisterController {
  final ApiService _apiService = ApiService();

  Future<Customer?> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final customer = await _apiService.registerCustomer(
        firstName,
        lastName,
        email,
        password,
      );

      if (customer != null) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Usuario registrado con éxito: ${customer.email}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(seconds: 3),
          ),
        );

        // Redirigir a HomeScreen después de mostrar el mensaje de éxito
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(customer: customer),
            ));

        return customer;
      }

      return customer;
    } catch (error) {
      String errorMessage =
          'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.';

      if (error is FormatException) {
        errorMessage =
            'Error de formato en la respuesta. Revisa la conexión o contacta al soporte.';
      } else {
        errorMessage = error.toString();
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(seconds: 3),
        ),
      );

      print('Error: $error');
      return null;
    }
  }
}
