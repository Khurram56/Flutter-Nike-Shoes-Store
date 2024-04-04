
import 'package:flutter/material.dart';
import 'package:go_router_sample/pages/productDetailsScreen.dart';

class Product {
  final String imagePath;
  final String description;
  Product({required this.imagePath, required this.description});
}


class ProductData {
  static List<Product> getProducts() {
    return [
      Product(
        imagePath: 'assets/c1.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/c2.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/c3.png',
        description: 'New Mens shoes \n \$35.00',
      ),
      Product(
        imagePath: 'assets/c4.png',
        description: 'New Mens shoes \n \$40.00',
      ),
      Product(
        imagePath: 'assets/c5.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/c6.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/c7.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/c8.png',
        description: 'New Mens shoes \n \$35.00',
      ),
      Product(
        imagePath: 'assets/c9.png',
        description: 'New Mens shoes \n \$40.00',
      ),
      Product(
        imagePath: 'assets/c10.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/c11.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/c12.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/c1.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/c2.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/c3.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/c4.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/c5.png',
        description: 'New Mens shoes \n \$25.00',
      ),
      Product(
        imagePath: 'assets/c6.png',
        description: 'New Mens shoes \n \$20.00',
      ),
      Product(
        imagePath: 'assets/c7.png',
        description: 'New Mens shoes \n \$45.00',
      ),
      Product(
        imagePath: 'assets/c8.png',
        description: 'New Mens shoes \n \$25.00',
      ),
    ];
  }
}

class CricketShoesGridView extends StatelessWidget {
  final List<Product> products = ProductData.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0), // Add padding at the bottom
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 15, // Adjust the width according to your layout
                  height: MediaQuery.of(context).size.width / 2 - 15, // Adjust the height according to your layout
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          products[index].imagePath,
                          fit: BoxFit.contain, // Adjust the fit property here
                        ),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
