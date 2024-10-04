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
  final List<String> shoeImages = [
    'assets/ropa/zap1.jpg',
    'assets/ropa/zap2.jpg',
    'assets/ropa/zap3.jpg',
  ];

  int _currentImageIndex = 0;
  late CarouselSliderController? _carouselController; // Usar CarouselSliderController directamente
  int _quantity = 0;
  String? selectedSize;
  final List<String> tallaProducto = ['28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40'];

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController(); // Inicializar el controlador sin casting
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController, // Usar CarouselController
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                      items: shoeImages.map((image) {
                        return Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: shoeImages.asMap().entries.map((entry) {
                        int index = entry.key;
                        String image = entry.value;
                        return GestureDetector(
                          onTap: () {
                            _carouselController?.animateToPage(index); // Navegar entre las páginas del carrusel
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
                                image,
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
              const SizedBox(height: 30),
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
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.productName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text('Stock: In Stock', style: TextStyle(color: Colors.green)),
              const SizedBox(height: 10),

              // Selección de talla en cuadros con desplazamiento horizontal
              const Text(
                'Talla: ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tallaProducto.map((size) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(size),
                        selected: selectedSize == size,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedSize = selected ? size : null;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text('Marca: ${widget.brand}', style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Checkout'),
              ),
              const SizedBox(height: 20),
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
                      setState(() {
                        if (_quantity > 0) _quantity--;
                      });
                    },
                  ),
                  Text('$_quantity'),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Bag'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
