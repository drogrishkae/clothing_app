import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Shop',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'DOUBLE-BREASTED 100% WOOL JACKET',
      'price': '4590 MKD',
      'description': 'Jacket made of 100% wool. Features a lapel collar, long sleeve and a front double-breasted fastening with embossed gold-tone buttons.',
      'image': 'assets/images/double-breasted_wool_jacket.jpg',
    },
    {
      'name': 'CABLE-KNIT SWEATER',
      'price': '2590 MKD',
      'description': 'Knitted sweater with vents. Round neck and long sleeves. Ribbed trims',
      'image': 'assets/images/cable-knit_sweater.jpg',
    },
    {
      'name': 'RUFFLED KNIT CARDIGAN',
      'price': '1590 MKD',
      'description': 'Plain knit cardigan with a round neck and long sleeves. Features ruffle trims and front button fastening.',
      'image': 'assets/images/ruffled_knit_cardigan.jpg',
    },
    {
      'name': 'COMBINED KNIT CARDIGAN WITH SEQUINS',
      'price': '4590 MKD',
      'description': 'Round neck, long sleeve jacket. Features velvet trims, sequin and bead appliqués and ribbed trims. Concealed snap-button fastening at the front.',
      'image': 'assets/images/combined_knit_cardigans_with_sequins.jpg'
          '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('201143'),
        backgroundColor: Color(0xFF800000),
        elevation: 4.0,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              leading: Image.asset(
                product['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Price: ${product['price']}'),
                  SizedBox(height: 4),
                  Text('Description: ${product['description']}'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
        backgroundColor: Color(0xFF800000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              product['image']!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(product['name']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Price: ${product['price']}'),
            SizedBox(height: 8),
            Text('Description:'),
            SizedBox(height: 8),
            Text(product['description']!),
          ],
        ),
      ),
    );
  }
}