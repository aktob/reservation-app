import 'package:reservation_app/services/Workers/Workers__services.dart';

class TestWorkerServices {
  void _getAllWorkers() async {
    try {
      final workerService = WorkerService();
      final workers = await workerService.getAllWorkers();
      print("✅ عدد العمال: ${workers.length}");
      for (var worker in workers) {
        print("👤 ${worker.name} - ${worker.availabilityStatus}");
      }
    } catch (e) {
      print("❌ حصل خطأ أثناء جلب العمال: $e");
    }
  }

  void _getWorkerById(int id) async {
    try {
      final workerService = WorkerService();
      final worker = await workerService.getWorkerById(id);

      print("✅ اسم العامل: ${worker.name}");
      print("📞 البريد: ${worker.workEmail ?? 'لا يوجد'}");
      print("⭐ التقييم: ${worker.cumulativeRating}");
    } catch (e) {
      print("❌ خطأ أثناء جلب العامل: $e");
    }
  }
}
