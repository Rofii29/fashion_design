import 'package:flutter/material.dart';
import 'buat.dart'; // Pastikan file ini berada pada path yang benar
import 'mydesign.dart'; // Pastikan file ini berada pada path yang benar

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Beranda(),
    );
  }
}

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Beranda()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Buatan()), // Navigate to Buatan
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyDesign()),
        );
        break;
      case 3:
        // Add the page you want to navigate to when the 'Pesan' icon is pressed.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghapus tombol kembali
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587',
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              'FASHION',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ingin style apa hari ini?',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 170.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildImageItem('https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587', 'a'),
                buildImageItem('https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587', 'b'),
                buildImageItem('https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587', 'c'),
                buildImageItem('https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587', 'd'),
                buildImageItem('https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587', 'f'),
                buildImageItem('https://torch.id/cdn/shop/articles/style_casual_pria_indonesia.webp?v=1701262587', 'g'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildHorizontalImagePair(
                  'https://cdn.shopify.com/s/files/1/0019/2105/6881/files/OptimizedBlog8-4.jpg?v=1674713056', 'h',
                  'https://cdn.shopify.com/s/files/1/0019/2105/6881/files/OptimizedBlog8-4.jpg?v=1674713056', 'i'),
                buildHorizontalImagePair(
                  'https://cdn.shopify.com/s/files/1/0019/2105/6881/files/OptimizedBlog8-4.jpg?v=1674713056', 'j',
                  'https://cdn.shopify.com/s/files/1/0019/2105/6881/files/OptimizedBlog8-4.jpg?v=1674713056', 'k'),
                buildHorizontalImagePair(
                  'https://cdn.shopify.com/s/files/1/0019/2105/6881/files/OptimizedBlog8-4.jpg?v=1674713056', 'l',
                  'https://cdn.shopify.com/s/files/1/0019/2105/6881/files/OptimizedBlog8-4.jpg?v=1674713056', 'm'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 171, 171, 171),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Buat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten),
            label: 'My Design',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesan',
          ),
        ],
      ),
    );
  }

  Widget buildImageItem(String imageUrl, String label) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 120.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalImagePair(String imageUrl1, String label1, String imageUrl2, String label2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildVerticalImageItem(imageUrl1, label1),
        buildVerticalImageItem(imageUrl2, label2),
      ],
    );
  }

  Widget buildVerticalImageItem(String imageUrl, String label) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
