// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_s6_mobile/screens/account_screen.dart';
import 'package:project_s6_mobile/screens/cart_screen.dart';
import 'package:project_s6_mobile/screens/product_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String? userName;
  String? userEmail;

  final List<Widget> _screens = [
    const HomeContentScreen(),
    const Center(child: Text('Tienda')),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Test de SharedPreferences: Guardar y recuperar un valor de prueba
      await prefs.setString('testKey', 'testValue');
      String? testValue = prefs.getString('testKey');
      print(
          "Valor de prueba en SharedPreferences: $testValue"); // Debería imprimir 'testValue'

      // Recuperar los datos reales del usuario
      setState(() {
        userName = prefs.getString('userName');
        userEmail = prefs.getString('userEmail');
      });
    } catch (e) {
      print("Error en _loadUserData: $e");
    }
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de bienvenida del usuario
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido, ${userName ?? 'Usuario'}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Email: ${userEmail ?? 'No disponible'}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: _screens[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
      currentIndex: _currentIndex,
      onTap: _onTap,
    );
  }
}

// Contenido de la pantalla de inicio
class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categorías populares',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildCategoryCarousel(),
            const SizedBox(height: 20),
            const Text(
              'Producto destacado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFeaturedProductCarousel(),
            const SizedBox(height: 20),
            const Text(
              'Productos populares',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPopularProductsCarousel(),
          ],
        ),
      ),
    );
  }

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

  Widget _buildPopularProductsCarousel() {
    final List<Map<String, dynamic>> products = [
      {
        'image': 'assets/ropa/zap1.jpg',
        'discount': '78%',
        'name': 'Green Nike sports shoe',
        'brand': 'Nike',
        'old_price': 600.0,
        'new_price': 400.0,
        'description':
            'This is a Product description for Nike Air Max. Placeholder text for now.',
      },
      {
        'image': 'assets/ropa/camisa.jpg',
        'discount': '14%',
        'name': 'Blue T-shirt for all ages',
        'brand': 'ZARA',
        'old_price': 35.0,
        'new_price': 30.0,
        'description': 'Description for a Blue T-shirt by ZARA.',
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
                width: 180,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              product['discount'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
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
