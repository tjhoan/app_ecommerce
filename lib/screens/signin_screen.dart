// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_s6_mobile/screens/home_screen.dart';
import 'package:project_s6_mobile/screens/signup_screen.dart';
import 'package:project_s6_mobile/utils/error_handler.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';
import '../controllers/auth_login_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthLoginController authLoginController = AuthLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Bienvenido de nuevo',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Input fields
              InputField(
                controller: emailController,
                hintText: 'Correo Electrónico',
                icon: Icons.email,
              ),
              const SizedBox(height: 10),
              InputField(
                controller: passwordController,
                hintText: 'Contraseña',
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 40),

              // Botón de Iniciar Sesión
              CustomButton(
                text: 'Iniciar Sesión',
                onPressed: () async {
                  final customer = await authLoginController.loginUser(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context,
                  );

                  if (customer == null) {
                    ErrorHandler.showErrorMessage(
                      context,
                      'Error: No se pudo iniciar sesión. Verifica tus credenciales o intenta de nuevo.',
                    );
                  } else {
                    // Muestra mensaje de bienvenida
                    ScaffoldMessenger.of(context).clearSnackBars();
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

                    // Navegar a HomeScreen después de mostrar el mensaje de éxito
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(customer: customer,),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),

              // Botón de Crear Cuenta
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Crear Cuenta'),
              ),

              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text('O Inicia Sesión Con'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.g_mobiledata),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.facebook),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
