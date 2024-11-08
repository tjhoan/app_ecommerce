import 'package:flutter/material.dart';
import 'bank_accounts_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sección superior de perfil con fondo azul
          Container(
            height: 170,
            width: double.infinity,
            color: const Color.fromARGB(255, 56, 90, 242),
            child: Stack(
              children: [
                const Positioned(
                  top: 25,
                  left: 20,
                  child: Text(
                    'Cuenta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Círculos decorativos en el fondo azul
                const Positioned(
                  top: 25,
                  left: -20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 15, 119, 246),
                  ),
                ),
                const Positioned(
                  top: -15,
                  right: -80,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundColor: Color.fromARGB(255, 15, 119, 246),
                  ),
                ),
                const Positioned(
                  top: 150,
                  left: 140,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 15, 119, 246),
                  ),
                ),

                // Información de usuario
                Positioned(
                  top: 80,
                  left: 20,
                  right: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://www.example.com/user_avatar.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre de Usuario',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'support@codingwithT.com',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sección de Account Settings
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    'Configuración de cuenta',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Color.fromARGB(255, 15, 119, 246)),
                    title: const Text('Mi dirección', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 15, 119, 246)),
                    title: const Text('Mi carrito', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_bag, color: Color.fromARGB(255, 15, 119, 246)),
                    title: const Text('Mis ordenes', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance, color: Color.fromARGB(255, 15, 119, 246)),
                    title: const Text('Cuenta Bancaria', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BankAccountsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
