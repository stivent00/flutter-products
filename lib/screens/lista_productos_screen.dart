import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/productos_provider.dart';
import 'detalle_producto_screen.dart';

class ListaProductosScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listaProductos = ref.watch(listaProductosProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: ListView.builder(
        itemCount: listaProductos.length + 1,
        itemBuilder: (context, index) {
          if (index < listaProductos.length) {
            final producto = listaProductos[index];
            return ListTile(
              leading: Image.network(producto['thumbnail'], width: 50, height: 50, fit: BoxFit.cover),
              title: Text(producto['title']),
              subtitle: Text('\$${producto['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleProductoScreen(producto: producto),
                  ),
                );
              },
            );
          } else {
            ref.read(listaProductosProvider.notifier).obtenerMasProductos();
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
