import 'package:flutter/material.dart';

class ShopNowDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              child: Image.asset(
                'assets/shoe4.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'New Mens shoes \n \$40.00',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Show SnackBar message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: SizedBox(
                      width: 20, // Set desired width here
                      height: 20,
                      child: Center(
                        child: Text(
                          'Item added successfully',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.green, // Set background color to green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    duration: Duration(seconds: 2), // Set duration to 2 seconds
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
