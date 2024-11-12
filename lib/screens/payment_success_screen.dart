import 'package:flutter/material.dart';
// import 'package:project_s6_mobile/screens/home_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono de pago exitoso (espacio para tu imagen)
              Image.asset(
                'assets/icons/metodo-de-pago.png',
                height: 100,
              ),
              const SizedBox(height: 24),
              // Texto de confirmación de pago
              const Text(
                'Pago Exitoso!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tu pedido será enviado pronto!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              // Botón para continuar comprando
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  // minimumSize: const Size(double.infinity, 50),
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                onPressed: () {
                  // Redirigir a HomeScreen después de mostrar el mensaje de éxito
                  // Navigator.pushAndRemoveUntil(context, 
                  // MaterialPageRoute(builder: (context) => const HomeScreen()),
                  // (Route<dynamic> route) => false);
                },
                child: const Text(
                  'Continuar Comprando',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
