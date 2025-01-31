import 'package:flutter/material.dart';
import '../../layouts/main_layout.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Shoe 1', 'price': 150.0, 'image': 'images/shoe1.jpg', 'quantity': 1},
    {'name': 'Shoe 2', 'price': 200.0, 'image': 'images/shoe2.jpg', 'quantity': 2},
    {'name': 'Shoe 3', 'price': 180.0, 'image': 'images/shoe3.jpg', 'quantity': 1},
  ];

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        children: [
          // Cart Items List
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(
                      cartItem['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(cartItem['name']),
                    subtitle: Text('\$${cartItem['price']} x ${cartItem['quantity']}'),
                    trailing: Text(
                      '\$${(cartItem['price'] * cartItem['quantity']).toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),

          // Total Price and Checkout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${_calculateTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement checkout logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Proceeding to checkout...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to calculate the total price of the cart
  double _calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}