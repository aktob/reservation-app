// ✅ rating_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservation_app/api_get.dart';
import '../../models/Rating_model.dart';


class RatingService {
  final String baseUrl = ApiGet.baseUrl;
  final String apiKey = ApiGet.apiKey;

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'api-key': apiKey,
  };

  // ✅ Get All Ratings
  Future<List<Rating>> getAllRatings() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List data = decoded['data'];
        return data.map((e) => Rating.fromJson(e)).toList();
      } else {
        throw Exception('فشل في تحميل التقييمات: ${response.body}');
      }
    } catch (e) {
      print('❌ خطأ في getAllRatings: $e');
      throw Exception('حدث خطأ أثناء تحميل التقييمات');
    }
  }

  // ✅ Create Rating
  Future<void> createRating(Map<String, dynamic> ratingData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode(ratingData),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('فشل في إنشاء التقييم: ${response.body}');
      }

      print("✅ تم إرسال التقييم بنجاح");
    } catch (e) {
      print("❌ خطأ في createRating: $e");
      throw Exception('حدث خطأ أثناء إرسال التقييم');
    }
  }
}
