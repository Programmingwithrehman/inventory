import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // This function is triggered when an item is tapped on the bottom navigation bar.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This function is triggered when an item is tapped in the drawer.
  void _onDrawerItemTapped(String item) {
    // You can add navigation functionality here
    print("Tapped on $item");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory System'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          _selectedIndex == 0
              ? 'Bill Inventory Screen'
              : _selectedIndex == 1
                  ? 'Receiving Screen'
                  : 'Stock Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
      // Drawer Menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Inventory Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Bill Ledger'),
              onTap: () => _onDrawerItemTapped('Bill Ledger'),
            ),
            ListTile(
              title: Text('Customer Ledger'),
              onTap: () => _onDrawerItemTapped('Customer Ledger'),
            ),
            ListTile(
              title: Text('Reports'),
              onTap: () => _onDrawerItemTapped('Reports'),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Bill Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Receiving',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Stock',
          ),
        ],
      ),
    );
  }
}
