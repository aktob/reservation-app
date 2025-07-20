import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservation_app/api_get.dart';
import 'package:reservation_app/models/Workers__model.dart';

class WorkerService {
  final String baseUrl = ApiGet.baseUrl;
  final String apiKey = ApiGet.apiKey;

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'api-key': apiKey,
  };

  // ✅ Get All Workers
  Future<List<Worker>> getAllWorkers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded is Map<String, dynamic> && decoded['data'] is List) {
          final List workersJson = decoded['data'];
          return workersJson.map((e) => Worker.fromJson(e)).toList();
        } else if (decoded is List) {
          return decoded.map((e) => Worker.fromJson(e)).toList();
        } else {
          throw Exception('شكل البيانات غير متوقع: $decoded');
        }
      } else {
        throw Exception(
          'فشل الاتصال بالسيرفر - Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('🔥 حصل خطأ أثناء جلب العمال: $e');
      throw Exception('خطأ أثناء تحميل العمال');
    }
  }

  // ✅ Get Worker By ID
  Future<Worker> getWorkerById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return Worker.fromJson(
          data is Map<String, dynamic> && data.containsKey('data')
              ? data['data']
              : data,
        );
      } else {
        throw Exception(
          'فشل في جلب العامل - Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('🔥 خطأ في getWorkerById: $e');
      throw Exception('حدث خطأ أثناء جلب العامل');
    }
  }
}
