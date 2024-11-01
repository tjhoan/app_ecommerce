import 'package:flutter/material.dart';

void showPaymentMethods(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona Método de Pago',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(context, Icons.payment, 'PayPal'),
            _buildPaymentOption(context, Icons.payment, 'Google Pay'),
            _buildPaymentOption(context, Icons.payment, 'Apple Pay'),
            _buildPaymentOption(context, Icons.credit_card, 'VISA'),
            _buildPaymentOption(context, Icons.credit_card, 'MasterCard'),
            _buildPaymentOption(context, Icons.payment, 'Paytm'),
          ],
        ),
      );
    },
  );
}

Widget _buildPaymentOption(BuildContext context, IconData icon, String methodName) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue),
    title: Text(methodName),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Método de pago seleccionado: $methodName')),
      );
    },
  );
}
