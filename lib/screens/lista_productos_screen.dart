import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/productos_provider.dart';
import 'detalle_producto_screen.dart';

class ListaProductosScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listaProductos = ref.watch(listaProductosProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
        ),        
      ),
      drawer: Drawer(
        child: ListView(     
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('DANIEL PEREZ'),
              accountEmail: Text('dspr124@gmail.com'),
              currentAccountPicture: CircleAvatar(foregroundImage: AssetImage('assets/images/avatar-daniel.jpg')),              
            )
          ],
        ),
      ),
      body: Container(        
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: listaProductos.length + 1,
          itemBuilder: (context, index) {
            if (index < listaProductos.length) {
              final producto = listaProductos[index];
              return Card(
                child: ListTile(
                  //leading: FlutterLogo(size: 56.0),
                  leading: Image.network(producto['thumbnail'], width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(producto['title']),
                  subtitle: Text('\$${producto['price']}', style: TextStyle( fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleProductoScreen(producto: producto),
                      ),
                    );
                  },
                ),
              );
              
            } else {
              ref.read(listaProductosProvider.notifier).obtenerMasProductos();
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
