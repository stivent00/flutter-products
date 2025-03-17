import 'package:flutter/material.dart';

class DetalleProductoScreen extends StatelessWidget {
  final Map<String, dynamic> producto;

  DetalleProductoScreen({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(producto['title'])),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(producto['thumbnail'], width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(producto['title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(producto['description'], style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Precio: \$${producto['price']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
