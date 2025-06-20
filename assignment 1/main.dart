import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageDisplayScreen(),
    );
  }
}

class ImageDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Display Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Image from Assets with Border Radius & Shadow
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/sample.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 30),

            // Image from Network with loading and error handling
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://example.com/sample.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 100, color: Colors.grey);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
