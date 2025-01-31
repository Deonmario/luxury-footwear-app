import 'package:flutter/material.dart';
import '../layouts/main_layout.dart';

class WishlistPage extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems = [
    {'name': 'Nike Air Max 270', 'price': 150.0, 'image': 'images/shoe1.jpg'},
    {'name': 'Adidas Ultraboost 22', 'price': 200.0, 'image': 'images/shoe2.jpg'},
    {'name': 'Puma RS-X', 'price': 180.0, 'image': 'images/shoe3.jpg'},
    {'name': 'New Balance 574', 'price': 250.0, 'image': 'images/shoe4.jpg'},
  ];

  WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Wishlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Wishlist Items List
          Expanded(
            child: ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final wishlistItem = wishlistItems[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(
                      wishlistItem['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(wishlistItem['name']),
                    subtitle: Text('\$${wishlistItem['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Implement remove from wishlist logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${wishlistItem['name']} removed from wishlist')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
