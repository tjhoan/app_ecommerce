import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;  // Variable para almacenar el estado del checkbox

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
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: InputField(
                        hintText: 'Nombre',
                        icon: Icons.person,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InputField(
                        hintText: 'Apellido',
                        icon: Icons.person_outline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const InputField(
                  hintText: 'Usuario',
                  icon: Icons.person_pin,
                ),
                const SizedBox(height: 10),
                const InputField(
                  hintText: 'Correo Electrónico',
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),
                const InputField(
                  hintText: 'Número de Teléfono',
                  icon: Icons.phone,
                ),
                const SizedBox(height: 10),
                const InputField(
                  hintText: 'Contraseña',
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                    const Flexible(
                      child: Text(
                        'Acepto la Política de Privacidad y los Términos de uso',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Inicia Sesión'),
                ),
                const SizedBox(height: 20),
                const Text('O Regístrate con'),
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
        ),
      ),
    );
  }
}
