// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_s6_mobile/screens/home_screen.dart';
import '../services/api_service.dart';
import '../models/customer.dart';
import '../utils/error_handler.dart';

class AuthLoginController {
  final ApiService _apiService = ApiService();

  Future<Customer?> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      ErrorHandler.showErrorMessage(
        context,
        'Por favor, ingresa tus credenciales completas.',
      );
      return null;
    }

    try {
      final customer = await _apiService.loginCustomer(email, password);

      if (customer == null) {
        ErrorHandler.showErrorMessage(
          context,
          'Usuario no encontrado. Verifica tus credenciales.',
        );
        return null;
      }

      // Intento de almacenar los datos del usuario en SharedPreferences
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userEmail', customer.email);
        await prefs.setString(
            'userName', "${customer.firstName} ${customer.lastName}");

        print("Email guardado: ${prefs.getString('userEmail')}");
        print("Nombre guardado: ${prefs.getString('userName')}");
      } catch (error) {
        print("Error en SharedPreferences: $error");
        ErrorHandler.showErrorMessage(
          context,
          "No se pudieron guardar los datos de usuario.",
        );
      }

      // Muestra mensaje de bienvenida
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Bienvenido de nuevo, ${customer.email}',
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

      // Redirige al HomeScreen si el login es exitoso
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

      return customer;
    } catch (error) {
      ErrorHandler.showErrorMessage(context, error.toString());
      print('Error: $error');
      return null;
    }
  }
}
