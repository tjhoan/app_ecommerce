import 'package:flutter/material.dart';
import 'add_bank_account.dart';

class BankAccountsScreen extends StatefulWidget {
  @override
  _BankAccountsScreenState createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  int _selectedIndex = 0; // Index para el radio seleccionado

  // Lista de cuentas de ejemplo actualizada
  final List<Map<String, String>> _bankAccounts = [
    {
      'nameBank': 'Bancolombia',
      'nameAccount': 'Bancolombia a la mano',
      'numberAccount': '03245678907'
    },
    {
      'nameBank': 'Daviplata',
      'nameAccount': 'Daviplata',
      'numberAccount': '3245678907'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Cuentas de banco',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _bankAccounts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio<int>(
                    value: index,
                    groupValue: _selectedIndex,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedIndex = value!;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 15, 119, 246), // Color del círculo seleccionado
                  ),
                  title: Text(
                    _bankAccounts[index]['nameBank']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_bankAccounts[index]['nameAccount']!),
                      Text(_bankAccounts[index]['numberAccount']!),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddBankAccountScreen(),
                    ),
                  );
                  // Acción para añadir una nueva cuenta
                  print("Añadir nueva cuenta presionado");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 119, 246), // Color de fondo del botón
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Añadir nueva cuenta',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
