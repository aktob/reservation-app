import 'package:intl/intl.dart';
import 'package:reservation_app/services/Wallets/Wallets__services.dart';

class TestingWalletsSevices {
  void _getAllWallets() async {
    try {
      final service = WalletService();
      final wallets = await service.getAllWallets();
      print("عدد المحافظ: ${wallets.length}");
    } catch (e) {
      print("❌ فشل في تحميل المحافظ: $e");
    }
  }

  void _getWalletById(int id) async {
    try {
      final walletService = WalletService();
      final wallet = await walletService.getWalletById(id);
      print("💼 اسم المحفظة: ${wallet.name}");
      print("👤 صاحبها: ${wallet.partnerName}");
      print("💰 الرصيد: ${wallet.balance}");
      print("💳 عدد المعاملات: ${wallet.transactions.length}");
    } catch (e) {
      print("❌ حصل خطأ أثناء جلب المحفظة: $e");
    }
  }

  void _createWallet() async {
    try {
      final walletService = WalletService();
      await walletService.createWallet({
        "name": "John's Wallet",
        "partner_id": 1,
      });
      print("✅ تم إنشاء المحفظة بنجاح");
    } catch (e) {
      print("❌ خطأ أثناء إنشاء المحفظة: $e");
    }
  }

  void _createTransaction() async {
    try {
      final service = WalletService();
      final formattedDate = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      ).format(DateTime.now());
      await service.createWalletTransaction(1, {
        "amount": 50.0,
        "type": "payment",
        "date": formattedDate, // ← الشكل المطلوب
      });
      print("✅ تم إضافة معاملة بنجاح");
    } catch (e) {
      print("❌ خطأ في المعاملة: $e");
    }
  }
}
