import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts(int skip, int limit) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'limit': limit, 'skip': skip},
      );
      return response.data['products'];
    } catch (e) {
      throw Exception('Error al obtener la lista de productos.');
    }
  }
}
