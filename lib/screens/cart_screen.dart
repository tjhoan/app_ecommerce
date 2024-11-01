import 'package:flutter/material.dart';
import 'package:project_s6_mobile/widgets/purchase_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = [1, 1, 2, 1, 1];
  List<double> itemPrices = [134.0, 35.0, 800.0, 500.0, 334.0];
  double total = 2004.0;

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
      total += itemPrices[index];
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
        total -= itemPrices[index];
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      total -= itemPrices[index] * quantities[index];
      quantities.removeAt(index);
      itemPrices.removeAt(index);
    });
  }

  void confirmDeletion(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Producto'),
          content: const Text('¿Estás seguro de eliminar el producto?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                removeItem(index);
                Navigator.of(context).pop();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void showPurchaseSummary() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return PurchaseSummary(
          subtotal: 2672.0,
          shippingFee: 5.0,
          taxFee: 267.20,
          orderTotal: total + 5.0 + 267.20,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: quantities.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(
                    index: index,
                    imageUrl: 'https://via.placeholder.com/50',
                    brand: index == 1 ? 'ZARA' : 'Nike',
                    name: index == 1 ? 'Blue T-shirt for all ages' : 'Sample Product Name',
                    color: index == 1 ? null : 'Color Green',
                    size: index == 1 ? null : 'Size EU 34',
                    price: itemPrices[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: showPurchaseSummary,
                child: Text(
                  'Finalizar Compra ${total.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required int index,
    required String imageUrl,
    required String brand,
    required String name,
    double? price,
    String? color,
    String? size,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Imagen del producto
              Image.network(imageUrl, width: 50, height: 50),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Marca y verificación
                    Row(
                      children: [
                        Text(
                          brand,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ),
                    // Nombre del producto
                    Text(name, style: const TextStyle(fontSize: 16)),
                    // Color y tamaño si están disponibles
                    if (color != null && size != null)
                      Text(
                        '$color  $size',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    const SizedBox(height: 8),
                    // Controles de cantidad
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Botón para disminuir cantidad
                        GestureDetector(
                          onTap: () => decrementQuantity(index),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 251, 252, 252),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                        // Cantidad del producto
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${quantities[index]}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Botón para aumentar cantidad
                        GestureDetector(
                          onTap: () => incrementQuantity(index),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Botón para eliminar producto
                  IconButton(
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 156, 154, 154)),
                    onPressed: () => confirmDeletion(index),
                  ),
                  // Precio total del producto en base a cantidad
                  Text(
                    '\$${(price! * quantities[index]).toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
