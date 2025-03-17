import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> obtenerProductos(int inicio, int limite) async {
    try {
      final respuesta = await _dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'limit': limite, 'skip': inicio},
      );
      return respuesta.data['products'];
    } catch (e) {
      throw Exception('Error al obtener la lista de productos.');
    }
  }
}
