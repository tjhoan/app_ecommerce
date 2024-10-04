import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importar la librería del carrusel

class ProductDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String brand;
  final double oldPrice;
  final double newPrice;
  final String description;

  const ProductDetailsScreen({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.brand,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
  });

  @override
  ProductDetailsScreenState createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // Lista de imágenes para el carrusel de zapatos
  final List<String> shoeImages = [
    'assets/ropa/zap1.jpg',
    'assets/ropa/zap2.jpg',
    'assets/ropa/zap3.jpg',
  ];

  int _currentImageIndex = 0; // Índice para rastrear la imagen seleccionada
  late PageController _pageController; // Controlador para la imagen principal

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Inicializar el controlador de la página
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Lógica para agregar a la lista de deseos
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen principal del producto
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index; // Actualizar el índice actual
                          });
                        },
                        itemCount: shoeImages.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            shoeImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Carrusel de miniaturas de los zapatos
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 80,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.3, // Para mostrar más de una miniatura
                      ),
                      items: shoeImages.asMap().entries.map((entry) {
                        int index = entry.key;
                        String item = entry.value;
                        return GestureDetector(
                          onTap: () {
                            // Cambiar a la imagen seleccionada
                            setState(() {
                              _currentImageIndex = index;
                              _pageController.jumpToPage(index);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentImageIndex == index ? Colors.blue : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 60,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Rating y botón de compartir
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('5.0 (199)', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // Lógica para compartir el producto
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Precios
              Row(
                children: [
                  Text(
                    '\$${widget.newPrice}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${widget.oldPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Información del producto
              Text(
                widget.productName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text('Stock: In Stock', style: TextStyle(color: Colors.green)),
              const SizedBox(height: 10),
              Text('Marca: ${widget.brand}', style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 20),
              // Botón de Checkout
              ElevatedButton(
                onPressed: () {
                  // Lógica de Checkout
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Checkout'),
              ),
              const SizedBox(height: 20),
              // Descripción del producto
              const Text(
                'Descripción',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      // Disminuir cantidad
                    },
                  ),
                  const Text('0'),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      // Aumentar cantidad
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Agregar al carrito
                },
                child: const Text('Add to Bag'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
