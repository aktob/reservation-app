import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reservation_app/api_get.dart';
import 'package:reservation_app/models/wallets_model.dart';

class WalletService {
  final String baseUrl = ApiGet.baseUrl;
  final String apiKey = ApiGet.apiKey;

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'api-key': apiKey,
  };

  // ✅ Get All Wallets
  Future<List<Wallet>> getAllWallets() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List walletsJson = decoded['data'];
        return walletsJson.map((e) => Wallet.fromJson(e)).toList();
      } else {
        throw Exception(
          'فشل في تحميل المحافظ - Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('❌ خطأ أثناء تحميل المحافظ: $e');
      throw Exception('خطأ في تحميل المحافظ');
    }
  }

  // ✅ Get Wallet by ID
  Future<Wallet> getWalletById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return Wallet.fromJson(decoded['data']);
      } else {
        throw Exception(
          'فشل في تحميل المحفظة - Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('❌ خطأ أثناء تحميل المحفظة: $e');
      throw Exception('خطأ في تحميل المحفظة');
    }
  }

  // ✅ Create New Wallet
  Future<void> createWallet(Map<String, dynamic> walletData) async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(walletData), // ❗ بدون "params"
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("فشل في إنشاء المحفظة: ${response.body}");
      }

      print("✅ تم إنشاء المحفظة بنجاح");
    } catch (e) {
      print("❌ خطأ في createWallet: $e");
      throw Exception('حدث خطأ أثناء إنشاء المحفظة');
    }
  }

  // ✅ Create Wallet Transaction
  Future<void> createWalletTransaction(
    int walletId,
    Map<String, dynamic> txData,
  ) async {
    final url = Uri.parse(
      '$baseUrl/$walletId/transaction',
    ); // ← تأكد ده المسار الصح حسب الـ API

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(txData),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("فشل في إنشاء المعاملة: ${response.body}");
      }

      print("✅ تمت المعاملة لمحفظة ID = $walletId");
    } catch (e) {
      print("❌ خطأ في createWalletTransaction: $e");
      throw Exception("حدث خطأ أثناء إنشاء المعاملة");
    }
  }
}
