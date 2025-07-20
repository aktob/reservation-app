import 'package:reservation_app/services/Contracts/Contracts_services.dart';

class TestingContractsServices {
  // ✅ جلب كل العقود
  void _getAllContracts() async {
    try {
      final contractService = ContractService();
      final contracts = await contractService.getAllContracts();
      print("📄 عدد العقود: ${contracts.length}");
      for (var contract in contracts) {
        print("🔹 عقد: ${contract.name} - العميل: ${contract.customerName}");
      }
    } catch (e) {
      print("❌ فشل في تحميل العقود: $e");
    }
  }

  // ✅ جلب عقد حسب ID
  void _getContractById(int id) async {
    try {
      final contractService = ContractService();
      final contract = await contractService.getContractById(id);
      print("📄 اسم العقد: ${contract.name}");
      print("👤 العميل: ${contract.customerName}");
      print("👷 العامل: ${contract.workerName}");
      print("💵 السعر: ${contract.totalPrice}");
      print("🗓 عدد الزيارات: ${contract.visitDates.length}");
    } catch (e) {
      print("❌ فشل في تحميل العقد: $e");
    }
  }

  // ✅ إنشاء عقد جديد
  void _createContract() async {
    try {
      final contractService = ContractService();
      await contractService.createContract({
        "customer_id": 33,
        "worker_id": 3,
        "start_time": "2025-07-01 10:00:00",
        "end_time": "2025-08-01 10:00:00",
        "total_price": 200.0,
        "contract_type": "single",
        "duration_in_months": 1,
      });
      print("✅ تم إنشاء العقد بنجاح");
    } catch (e) {
      print("❌ خطأ أثناء إنشاء العقد: $e");
    }
  }

  // ✅ تأكيد عقد
  void _confirmContract(int contractId) async {
    try {
      final contractService = ContractService();
      await contractService.confirmContract(contractId);
      print("✅ تم تأكيد العقد");
    } catch (e) {
      print("❌ فشل في تأكيد العقد: $e");
    }
  }

  // ✅ إلغاء عقد
  void _cancelContract(int contractId) async {
    try {
      final contractService = ContractService();
      await contractService.cancelContract(contractId);
      print("✅ تم إلغاء العقد");
    } catch (e) {
      print("❌ فشل في إلغاء العقد: $e");
    }
  }

  // ✅ إنشاء فاتورة لعقد
  void _createInvoice(int contractId) async {
    try {
      final contractService = ContractService();
      await contractService.createInvoice(contractId);
      print("✅ تم إنشاء الفاتورة للعقد بنجاح");
    } catch (e) {
      print("❌ فشل في إنشاء الفاتورة: $e");
    }
  }
}
