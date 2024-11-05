import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text('Admin Panel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey, 
              ),
              child: Text('Admin Panel', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.checkroom),
              title: const Text('Team'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Marcas'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Admin Panel'),
      ),
    );
  }
}
