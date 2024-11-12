// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ErrorHandler {
  static void showErrorMessage(BuildContext context, String message) {
    // Limpiar cualquier SnackBar existente antes de mostrar uno nuevo
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
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
  }

  static String handleHttpError(int statusCode) {
    // Imprime el código de estado para la depuración
    print("HTTP Error - Status Code: $statusCode");

    switch (statusCode) {
      case 401:
        return 'Credenciales incorrectas. Por favor, verifica tu correo y contraseña.';
      case 404:
        return 'Recurso no encontrado. Verifica la URL del servidor.';
      case 500:
        return 'Error del servidor. Intenta de nuevo más tarde.';
      default:
        return 'Error inesperado. Código: $statusCode';
    }
  }

  static String handleNetworkError(error) {
    // Imprime el error completo para la depuración
    print("Network Error: $error");

    if (error.toString().contains('SocketException')) {
      return 'No hay conexión a Internet. Revisa tu conexión y vuelve a intentarlo.';
    } else if (error.toString().contains('TimeoutException')) {
      return 'Tiempo de espera agotado. El servidor no respondió a tiempo.';
    } else {
      return 'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.';
    }
  }
}
