import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservation_app/api_get.dart';
import '../../models/Contracts_model.dart';

class ContractService {
  final String baseUrl = ApiGet.baseUrl;
  final String apiKey = ApiGet.apiKey;

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'api-key': apiKey,
  };

  Future<List<Contract>> getAllContracts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List contractsJson = decoded['data'];
        return contractsJson.map((e) => Contract.fromJson(e)).toList();
      } else {
        throw Exception("فشل تحميل العقود - Status: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء تحميل العقود: $e");
      throw Exception("حدث خطأ أثناء تحميل العقود");
    }
  }

  Future<Contract> getContractById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return Contract.fromJson(decoded['data']);
      } else {
        throw Exception("فشل تحميل العقد - Status: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء تحميل العقد: $e");
      throw Exception("حدث خطأ أثناء تحميل العقد");
    }
  }

  Future<void> createContract(Map<String, dynamic> contractData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode(contractData),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("فشل في إنشاء العقد: ${response.body}");
      }
      print("✅ تم إنشاء العقد");
    } catch (e) {
      print("❌ خطأ في إنشاء العقد: $e");
      throw Exception("حدث خطأ أثناء إنشاء العقد");
    }
  }

Future<void> confirmContract(int id) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/$id/confirm'), // ✅ رابط صحيح
      headers: headers,
    );

    print("📥 Response: ${response.body}");
    print("📊 Status Code: ${response.statusCode}");

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("فشل في تأكيد العقد: ${response.body}");
    }

    print("✅ تم تأكيد العقد بنجاح");
  } catch (e) {
    print("❌ فشل في تأكيد العقد: $e");
    throw Exception("حدث خطأ أثناء تأكيد العقد");
  }
}

  Future<void> cancelContract(int id) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$id/cancel'),
        headers: headers,
      );
      if (response.statusCode != 200) {
        throw Exception("فشل في إلغاء العقد");
      }
    } catch (e) {
      throw Exception("حدث خطأ أثناء إلغاء العقد");
    }
  }

  Future<void> createInvoice(int id) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/$id/create_invoice'), // ✅ تم التعديل هنا
      headers: headers,
    );

    print("📥 Response Body: ${response.body}");
    print("📊 Status Code: ${response.statusCode}");

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("فشل في إنشاء الفاتورة: ${response.body}");
    }

    print("✅ تم إنشاء الفاتورة بنجاح");
  } catch (e) {
    print("❌ فشل في إنشاء الفاتورة: $e");
    throw Exception("حدث خطأ أثناء إنشاء الفاتورة");
  }
}

}
