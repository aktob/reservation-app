import 'package:reservation_app/services/Customers/Customers__services.dart';

class TestingCustomersServices {
  // ✅ Get All Customers
  void _getAllCustomers() async {
    try {
      final service = CustomerService();
      final customers = await service.getAllCustomers();
      print("👥 عدد العملاء: ${customers.length}");
    } catch (e) {
      print("❌ فشل في تحميل العملاء: $e");
    }
  }

  // ✅ Get Customer by ID
  void _getCustomerById(int id) async {
    try {
      final service = CustomerService();
      final customer = await service.getCustomerById(id);
      print("👤 اسم العميل: ${customer.name}");
      print("📧 البريد: ${customer.email ?? 'غير متوفر'}");
      print("📍 GPS: ${customer.gpsCoordinates}");
      print("📄 نوع التعاقد: ${customer.contractType}");
    } catch (e) {
      print("❌ حصل خطأ أثناء جلب العميل: $e");
    }
  }

  // ✅ Create Customer
  void _createCustomer() async {
    try {
      final service = CustomerService();
      await service.createCustomer({
        "name": "Ahmed Magdy",
        "email": "ahmed.magdy@example.com",
        "phone": "+201100000000",
        "gps_coordinates": "30.033333,31.233334",
        "contract_type": "single",
      });
      print("✅ تم إنشاء العميل بنجاح");
    } catch (e) {
      print("❌ فشل في إنشاء العميل: $e");
    }
  }

  // ✅ Update Customer
  void _updateCustomer() async {
    try {
      final service = CustomerService();
      await service.updateCustomer(11, {
        "city": "Giza",
        "email": "updated.email@example.com",
      });
      print("✅ تم تحديث بيانات العميل");
    } catch (e) {
      print("❌ فشل في تحديث العميل: $e");
    }
  }

  // ✅ Add Preferred Worker
  void _addPreferredWorker() async {
    try {
      final service = CustomerService();
      await service.addPreferredWorker(11, 3); // ID العميل و ID العامل
      print("✅ تم إضافة العامل المفضل للعميل");
    } catch (e) {
      print("❌ فشل في إضافة العامل المفضل: $e");
    }
  }
}
