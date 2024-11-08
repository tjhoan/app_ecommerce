// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../services/api_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    // Validar los datos antes de proceder
    if (_formKey.currentState?.validate() ?? false) {
      print('Datos ingresados:');
      print('Nombre: ${_firstNameController.text}');
      print('Apellido: ${_lastNameController.text}');
      print('Correo Electrónico: ${_emailController.text}');
      print('Contraseña: ${_passwordController.text}');
      
      try {
        final customer = await _apiService.registerCustomer(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _passwordController.text,
        );
        if (customer != null) {
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
        }
      } catch (error) {
        String errorMessage =
            'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.';

        if (error is FormatException) {
          errorMessage =
              'Error de formato en la respuesta. Revisa la conexión o contacta al soporte.';
        } else {
          errorMessage = error
              .toString();
        }

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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          controller: _firstNameController,
                          hintText: 'Nombre',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa tu nombre';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InputField(
                          controller: _lastNameController,
                          hintText: 'Apellido',
                          icon: Icons.person_outline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa tu apellido';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: _emailController,
                    hintText: 'Correo Electrónico',
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu correo electrónico';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._+]+@[a-zA-Z]+\.[a-zA-Z]{2,6}$')
                          .hasMatch(value)) {
                        return 'Ingresa un correo electrónico válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: _passwordController,
                    hintText: 'Contraseña',
                    icon: Icons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa una contraseña';
                      } else if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirmar Contraseña',
                    icon: Icons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirma tu contraseña';
                      } else if (value != _passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
