import 'package:flutter/material.dart';

class PurchaseSummary extends StatelessWidget {
  final double subtotal;
  final double shippingFee;
  final double taxFee;
  final double orderTotal;

  const PurchaseSummary({
    super.key,
    required this.subtotal,
    required this.shippingFee,
    required this.taxFee,
    required this.orderTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Resumen de Compra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildSummaryRow('Subtotal', subtotal),
          _buildSummaryRow('Costo de Envío', shippingFee),
          _buildSummaryRow('Impuestos', taxFee),
          const Divider(),
          _buildSummaryRow('Total del Pedido', orderTotal, isTotal: true),
          const SizedBox(height: 16),
          _buildPaymentMethod(),
          const SizedBox(height: 16),
          _buildShippingAddress(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para finalizar la compra
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Confirmar Compra', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text('\$${value.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.payment, color: Colors.blue),
      title: const Text('Método de Pago'),
      subtitle: const Text('PayPal'),
      trailing: TextButton(
        onPressed: () {
          // Agregar acción para cambiar el método de pago
        },
        child: const Text('Cambiar', style: TextStyle(color: Colors.blue)),
      ),
    );
  }

  Widget _buildShippingAddress() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.location_on, color: Colors.blue),
      title: const Text('Dirección de Envío'),
      subtitle: const Text('Coding with T\n+923178059528\n82311 Timmy Coves, South Liana, Maine, 87547, USA'),
      trailing: TextButton(
        onPressed: () {
          // Agregar acción para cambiar la dirección
        },
        child: const Text('Cambiar', style: TextStyle(color: Colors.blue)),
      ),
    );
  }
}
