// ✅ booking_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/booking_model.dart';
import 'package:reservation_app/api_get.dart';

class BookingService {
  final String baseUrl = ApiGet.baseUrl;
  final String apiKey = ApiGet.apiKey;

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'api-key': apiKey,
  };

  Future<List<Booking>> getAllBookings() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded is Map<String, dynamic> && decoded['data'] is List) {
          final List bookingsJson = decoded['data'];
          return bookingsJson.map((e) => Booking.fromJson(e)).toList();
        } else if (decoded is List) {
          return decoded.map((e) => Booking.fromJson(e)).toList();
        } else {
          throw Exception('Unexpected response format: $decoded');
        }
      } else {
        throw Exception(
          'فشل الاتصال بالسيرفر - Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('🔥 حصل خطأ أثناء جلب الحجوزات: $e');
      throw Exception('خطأ أثناء تحميل البيانات');
    }
  }

  Future<Booking> getBookingById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Booking.fromJson(
          data is Map<String, dynamic> && data.containsKey('data')
              ? data['data']
              : data,
        );
      } else {
        throw Exception(
          'فشل في جلب الحجز - Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('🔥 خطأ في getBookingById: $e');
      throw Exception('حدث خطأ أثناء جلب الحجز');
    }
  }

Future<void> createBooking(Map<String, dynamic> bookingData) async {
  final url = Uri.parse(baseUrl);

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(bookingData), // 👈 هنا بنبعت الداتا مباشرة من غير params
    );

    print("📊 Status Code: ${response.statusCode}");
    print("📥 Response Body: ${response.body}");

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("فشل في إنشاء الحجز: ${response.body}");
    }

    print("✅ تم إنشاء الحجز بنجاح");
  } catch (e) {
    print("❌ خطأ في createBooking: $e");
    throw Exception('حدث خطأ أثناء إنشاء الحجز');
  }
}

  Future<void> updateBooking(int id, Map<String, dynamic> bookingData) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
        body: jsonEncode(bookingData),
      );
      if (response.statusCode != 200) {
        throw Exception('فشل في تعديل الحجز');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء تعديل الحجز');
    }
  }

  Future<void> deleteBooking(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('فشل في حذف الحجز');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء حذف الحجز');
    }
  }

  Future<void> confirmBooking(int id) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$id/confirm'),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('فشل في تأكيد الحجز');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء تأكيد الحجز');
    }
  }

  Future<void> cancelBooking(int id) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$id/cancel'),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception('فشل في إلغاء الحجز');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء إلغاء الحجز: $e');
    }
  }
}
