import 'package:flutter/material.dart';

void showAddressForm(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddNewAddressScreen(),
      );
    },
  );
}

// Widget para el formulario de dirección
class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Agregar nueva dirección',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            icon: Icons.person,
            hintText: 'Nombre',
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            icon: Icons.phone,
            hintText: 'Número de Celular',
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: CustomTextField(
                  icon: Icons.home,
                  hintText: 'Dirección',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  icon: Icons.location_on,
                  hintText: 'Código Postal',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: CustomTextField(
                  icon: Icons.location_city,
                  hintText: 'Ciudad',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  icon: Icons.map,
                  hintText: 'Departamento',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            icon: Icons.public,
            hintText: 'País',
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dirección guardada')),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

// Campo de texto personalizado para el formulario de dirección
class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;

  const CustomTextField({required this.icon, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
