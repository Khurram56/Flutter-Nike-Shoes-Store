import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/productDetailsScreen.dart';
// import 'package:go_router_sample/project/routes/app_route_constants.dart';
// import 'package:go_router_sample/project/routes/app_route_config.dart';
class Product {
  final String imagePath;
  final String description;
  Product({required this.imagePath, required this.description});
}

class ProductData {
  static List<Product> getProducts() {
    return [
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$35.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$40.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$35.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$40.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$35.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$40.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$35.00',
      ),
      Product(
        imagePath: 'assets/shoe2.png',
        description: 'New Mens shoes \n \$40.00',
      ),
      Product(
        imagePath: 'assets/shoe1.png',
        description: 'New Mens shoes \n \$45.00',
      ),
    ];
  }
}

class ProductGridView extends StatelessWidget {
  final List<Product> products = ProductData.getProducts();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  imagePath: products[index].imagePath,
                  description: products[index].description,
                ),
              ),
            );

          },
          child: Column(
            children: [
              Image.asset(
                products[index].imagePath,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5), // Add spacing between the image and text
              Center(
                child: Text(
                  products[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
