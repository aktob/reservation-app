// ✅ customers_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservation_app/api_get.dart';

import '../../models/Customers_model.dart';



class CustomerService {
  final String baseUrl = ApiGet.baseUrl;
  final String apiKey = ApiGet.apiKey;

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'api-key': apiKey,
  };

  // ✅ Get All Customers
  Future<List<Customer>> getAllCustomers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List customersJson = decoded['data'];
        return customersJson.map((e) => Customer.fromJson(e)).toList();
      } else {
        throw Exception('فشل في تحميل العملاء - Status: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ خطأ أثناء تحميل العملاء: $e');
      throw Exception('خطأ في تحميل العملاء');
    }
  }

  // ✅ Get Customer by ID
  Future<Customer> getCustomerById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'), headers: headers);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return Customer.fromJson(decoded['data']);
      } else {
        throw Exception('فشل في تحميل العميل - Status: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ خطأ أثناء تحميل العميل: $e');
      throw Exception('خطأ في تحميل العميل');
    }
  }

  // ✅ Create Customer
  Future<void> createCustomer(Map<String, dynamic> customerData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode(customerData),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("فشل في إنشاء العميل: ${response.body}");
      }
      print("✅ تم إنشاء العميل بنجاح");
    } catch (e) {
      print("❌ خطأ في createCustomer: $e");
      throw Exception('حدث خطأ أثناء إنشاء العميل');
    }
  }

  // ✅ Update Customer
  Future<void> updateCustomer(int id, Map<String, dynamic> updatedData) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
        body: jsonEncode(updatedData),
      );
      if (response.statusCode != 200) {
        throw Exception('فشل في تحديث العميل');
      }
      print("✅ تم تحديث بيانات العميل");
    } catch (e) {
      print("❌ خطأ في updateCustomer: $e");
      throw Exception('حدث خطأ أثناء تحديث العميل');
    }
  }

  // ✅ Add Preferred Worker to Customer
  Future<void> addPreferredWorker(int customerId, int workerId) async {
    final url = Uri.parse('$baseUrl/$customerId/preferred-worker');
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({"worker_id": workerId}),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("فشل في إضافة العامل المفضل: ${response.body}");
      }
      print("✅ تم إضافة العامل المفضل بنجاح");
    } catch (e) {
      print("❌ خطأ في addPreferredWorker: $e");
      throw Exception('حدث خطأ أثناء ربط العامل بالعميل');
    }
  }
}