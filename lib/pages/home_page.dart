import 'package:flutter/material.dart';
import '../../layouts/main_layout.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> featuredProducts = [
    {'image': 'images/shoe1.jpg', 'name': 'Nike Air Max 270', 'price': 150.0},
    {'image': 'images/shoe2.jpg', 'name': 'Adidas Ultraboost 22', 'price': 200.0},
    {'image': 'images/shoe3.jpg', 'name': 'Puma RS-X', 'price': 180.0},
    {'image': 'images/shoe4.jpg', 'name': 'New Balance 574', 'price': 250.0},
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                _buildHeroSection(),

                // Categories Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildCategories(isWideScreen),

                // Featured Products
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildFeaturedProductsGrid(context, isWideScreen),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      children: [
        Image.asset(
          'images/hero_shoe.jpg',
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Shop Now',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories(bool isWideScreen) {
    final categories = [
      {'title': 'Men', 'icon': Icons.male},
      {'title': 'Women', 'icon': Icons.female},
      {'title': 'New Arrivals', 'icon': Icons.new_releases},
      {'title': 'Bestsellers', 'icon': Icons.star},
    ];

    return Container(
      height: isWideScreen ? 150 : 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: isWideScreen ? 40 : 30,
                  backgroundColor: Colors.black,
                  child: Icon(
                    categories[index]['icon'] as IconData,
                    color: Colors.white,
                    size: isWideScreen ? 30 : 24,
                  ),
                ),
                SizedBox(height: 8),
                Text(categories[index]['title'] as String),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedProductsGrid(BuildContext context, bool isWideScreen) {
    final crossAxisCount = isWideScreen ? 4 : 2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: featuredProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showProductDetailsDialog(context, featuredProducts[index]);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  featuredProducts[index]['image'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

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
