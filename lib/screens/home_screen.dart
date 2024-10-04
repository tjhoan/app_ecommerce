import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importación del slider
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_s6_mobile/screens/product_details_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.lock),
            onPressed: () {
              // Lógica para el icono de perfil
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
              // Nombre de usuario y barra de búsqueda
              const Text(
                'Juan Torres',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar en la tienda',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Carrusel de categorías populares
              const Text(
                'Categorías populares',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCategoryCarousel(),

              const SizedBox(height: 20),

              // Carrusel de productos destacados (sneakers)
              const Text(
                'Producto destacado',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildFeaturedProductCarousel(),

              const SizedBox(height: 20),

              // Carrusel de productos populares
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Productos populares',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Lógica para ver todos los productos
                    },
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildPopularProductsCarousel(),
            ],
          ),
        ),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0, // Controla cuál está seleccionado
        onTap: (index) {
          // Lógica para cambiar de pantalla
        },
      ),
    );
  }

  // Carrusel de categorías populares
  Widget _buildCategoryCarousel() {
    final categories = [
      {'icon': MdiIcons.necklace, 'label': 'Cadenas'},
      {'icon': MdiIcons.glasses, 'label': 'Gafas'},
      {'icon': MdiIcons.tshirtCrew, 'label': 'Ropa'},
      {'icon': MdiIcons.shoeSneaker, 'label': 'Zapatos'},
      {'icon': MdiIcons.watch, 'label': 'Relojes'},
      {'icon': MdiIcons.sprayBottle, 'label': 'Lociones'},
      {'icon': MdiIcons.weightLifter, 'label': 'Deportes'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(categories[index]['icon'] as IconData?, size: 30),
                ),
                const SizedBox(height: 5),
                Text(categories[index]['label'] as String),
              ],
            ),
          );
        },
      ),
    );
  }

  // Carrusel de producto destacado (sneakers)
  Widget _buildFeaturedProductCarousel() {
    final List<String> imgList = [
      'assets/ropa/zap1.jpg',
      'assets/ropa/zap2.jpg',
      'assets/ropa/zap3.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: imgList
          .map((item) => ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ))
          .toList(),
    );
  }

  // Carrusel de productos populares
  Widget _buildPopularProductsCarousel() {
    final List<Map<String, dynamic>> products = [
      {
        'image': 'assets/ropa/zap1.jpg',
        'discount': '78%',
        'name': 'Green Nike sports shoe',
        'brand': 'Nike',
        'old_price': 600.0,
        'new_price': 400.0,
        'description': 'This is a Product description for Nike Air Max. There are more things that can be added but I am just putting a placeholder text here for now.',
      },
      {
        'image': 'assets/ropa/camisa.jpg',
        'discount': '14%',
        'name': 'Blue T-shirt for all ages',
        'brand': 'ZARA',
        'old_price': 35.0,
        'new_price': 30.0,
        'description': 'This is a description for a Blue T-shirt by ZARA.',
      },
    ];

    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla de detalles del producto
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    imagePath: product['image'],
                    productName: product['name'],
                    brand: product['brand'],
                    oldPrice: product['old_price'],
                    newPrice: product['new_price'],
                    description: product['description'],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 180, // Ancho de la tarjeta
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            product['image'],
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              product['discount'],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product['brand'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '\$${product['new_price']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '\$${product['old_price']}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Botón para agregar al carrito
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
