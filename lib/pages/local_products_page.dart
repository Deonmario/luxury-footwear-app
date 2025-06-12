import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalProductsPage extends StatefulWidget {
  const LocalProductsPage({Key? key}) : super(key: key);

  @override
  _LocalProductsPageState createState() => _LocalProductsPageState();
}

class _LocalProductsPageState extends State<LocalProductsPage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    loadLocalData();
  }

  Future<void> loadLocalData() async {
    final String jsonData = await rootBundle.loadString('assets/local_products.json');
    final List<dynamic> parsedData = jsonDecode(jsonData);
    setState(() {
      products = parsedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Products')),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return ListTile(
                  leading: Image.asset(item['image'], width: 50, height: 50),
                  title: Text(item['name']),
                  subtitle: Text('\$${item['price']}'),
                );
              },
            ),
    );
  }
}
