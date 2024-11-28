import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

void main() {
  // Entry point for the Flutter app
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Flutter Store', // App title
      theme: ThemeConfig.lightTheme, // Light theme
      darkTheme: ThemeConfig.darkTheme, // Dark theme
      themeMode: ThemeMode.light, // Default theme mode
      home: CatalogPage(), // Starting page of the app
    );
  }
}

// Catalog page that displays the list of products
class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool isDarkMode = false; // Tracks the current theme mode

  // List of products to display in the catalog
  final List<Product> products = [
    Product(
        name: 'Laptop',
        imageUrl:
            'https://images.pexels.com/photos/238118/pexels-photo-238118.jpeg',
        price: 1000.00),
    Product(
        name: 'Smartphone',
        imageUrl:
            'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg',
        price: 500.00),
    Product(
        name: 'Headphones',
        imageUrl:
            'https://images.pexels.com/photos/1649771/pexels-photo-1649771.jpeg',
        price: 150.00),
    Product(
        name: 'Smartwatch',
        imageUrl:
            'https://images.pexels.com/photos/437038/pexels-photo-437038.jpeg',
        price: 200.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Store'), // AppBar title
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ), // Toggle icon
            onPressed: () {
              setState(() {
                // Toggle theme mode
                isDarkMode = !isDarkMode;
                Get.changeThemeMode(
                    isDarkMode ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            childAspectRatio: 0.8, // Aspect ratio for grid items
          ),
          itemCount: products.length, // Number of items
          itemBuilder: (context, index) {
            final product = products[index]; // Get the product at the index
            return ProductCard(product: product); // Create a ProductCard
          },
        ),
      ),
    );
  }
}

// Widget to display individual product details in a card
class ProductCard extends StatelessWidget {
  final Product product;

  // Constructor for the ProductCard widget
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Display a snackbar with product details
        Get.snackbar(
          'Product Selected',
          product.name,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Animation duration
        curve: Curves.easeInOut, // Animation curve
        margin: EdgeInsets.all(8), // Margin for the card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          color: Theme.of(context).cardColor, // Card color from theme
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurpleAccent.withOpacity(0.6), // Box shadow
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content
          children: [
            // Display the product image
            Image.network(
              product.imageUrl,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 80, color: Colors.red);
              },
            ),
            SizedBox(height: 8),
            // Display the product name
            Text(
              product.name,
            ),
            SizedBox(height: 4),
            // Display the product price
            Text(
              '\$${product.price}',
            ),
          ],
        ),
      ),
    );
  }
}
