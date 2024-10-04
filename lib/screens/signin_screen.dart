import 'package:flutter/material.dart';
import 'package:project_s6_mobile/screens/home_screen.dart';
import 'package:project_s6_mobile/screens/signup_screen.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Input fields
              const InputField(
                hintText: 'Correo Electrónico',
                icon: Icons.email,
              ),
              const SizedBox(height: 10),
              const InputField(
                hintText: 'Contraseña',
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 40),

              // Botón de Iniciar Sesión
              CustomButton(
                text: 'Iniciar Sesión',
                onPressed: () {
                  // Navegar a la pantalla de inicio (HomeScreen) al iniciar sesión
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()), // Navegar a HomeScreen
                  );
                },
              ),
              const SizedBox(height: 10),

              // Botón de Crear Cuenta
              OutlinedButton(
                onPressed: () {
                  // Navegar a la pantalla de registro (SignUpScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()), // Navegar a SignUpScreen
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Crear Cuenta'),
              ),

              const SizedBox(height: 20),

              // Divider and Social Login
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
                          onPressed: () {
                            // Acción de inicio de sesión con Google
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.facebook),
                          onPressed: () {
                            // Acción de inicio de sesión con Facebook
                          },
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
