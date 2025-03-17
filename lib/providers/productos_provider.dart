import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

//Maneja la lista de productos
final listaProductosProvider = StateNotifierProvider<ProductosNotifier, List<dynamic>>((ref) {
  return ProductosNotifier(ref.read(apiServiceProvider));
});

class ProductosNotifier extends StateNotifier<List<dynamic>> {
  final ApiService _apiService;
  int _inicio = 0;
  final int _limite = 10;
  bool _cargando = false;

  ProductosNotifier(this._apiService) : super([]);

  //Carga mas productos con el scroll
  Future<void> obtenerMasProductos() async {
    if (_cargando) return;
    _cargando = true;

    final nuevosProductos = await _apiService.obtenerProductos(_inicio, _limite);
    state = [...state, ...nuevosProductos];

    _inicio += _limite;
    _cargando = false;
  }
}
