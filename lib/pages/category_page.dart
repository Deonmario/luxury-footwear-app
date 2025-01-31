import 'package:flutter/material.dart';
import '../../layouts/main_layout.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({Key? key, required this.categoryName}) : super(key: key);

  // Sample shoes for each category
  final List<Map<String, dynamic>> shoes = [
    {'image': 'images/shoe1.jpg', 'name': 'Nike Air Max 270', 'price': 150.0},
    {'image': 'images/shoe2.jpg', 'name': 'Adidas Ultraboost 22', 'price': 200.0},
    {'image': 'images/shoe3.jpg', 'name': 'Puma RS-X', 'price': 180.0},
    {'image': 'images/shoe4.jpg', 'name': 'New Balance 574', 'price': 250.0},
    {'image': 'images/shoe5.jpg', 'name': 'Reebok Classic', 'price': 100.0},
    {'image': 'images/shoe6.jpg', 'name': 'Under Armour Curry One', 'price': 220.0},
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            final shoe = shoes[index];
            return GestureDetector(
              onTap: () {
                _showProductDetailsDialog(context, shoe); // Show product details dialog
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    shoe['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Method to show product details dialog
  void _showProductDetailsDialog(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                product['image'],
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                product['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '\$${product['price'].toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to cart')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Add to Cart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to wishlist')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Wishlist'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
