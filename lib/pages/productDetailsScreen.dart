import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imagePath;
  final String description;

  ProductDetailScreen({required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Center( // Wrap the Column with Center
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center, // Set textAlign to center
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement add to cart functionality here
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
