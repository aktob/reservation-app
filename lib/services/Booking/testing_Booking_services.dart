import 'package:reservation_app/services/Booking/Booking_services.dart';

class TestingBookingServices {
  // ✅ 1. جلب كل الحجوزات
  void getAllBookings() async {
    try {
      final bookingService = BookingService();
      final bookings = await bookingService.getAllBookings();
      print("📦 عدد الحجوزات: ${bookings.length}");
      for (var b in bookings) {
        print("📄 حجز: ${b.name} - العميل: ${b.customerName}");
      }
    } catch (e) {
      print("❌ فشل في تحميل الحجوزات: $e");
    }
  }

  // ✅ 2. جلب حجز عن طريق ID
  void getBookingById(int id) async {
    try {
      final bookingService = BookingService();
      final booking = await bookingService.getBookingById(id);
      print("📄 اسم الحجز: ${booking.name}");
      print("👤 العميل: ${booking.customerName}");
      print("👷 العامل: ${booking.workerName}");
      print("🕒 المدة: ${booking.duration} ساعة");
    } catch (e) {
      print("❌ فشل في تحميل الحجز: $e");
    }
  }

  // ✅ 3. إنشاء حجز جديد
  void createBooking() async {
    try {
      final bookingService = BookingService();

      await bookingService.createBooking({
        "customer_id": 9,
        "worker_id": 3,
        "service_id": 1,
        "booking_date": "2024-06-1",
        "start_time": "2024-06-15 10:00:00",
        "end_time": "2024-06-15 12:00:00",
      });

      print("✅ تم إنشاء الحجز بنجاح");
    } catch (e) {
      print("❌ فشل في إنشاء الحجز: $e");
    }
  }

  // ✅ 4. تعديل حجز موجود
  void updateBooking(int id) async {
    try {
      final bookingService = BookingService();
      await bookingService.updateBooking(id, {
        "booking_date": "2024-06-01",
        "start_time": "2024-06-15 10:00:00",
        "end_time": "2024-06-15 12:00:00",
      });
      print("✅ تم تحديث الحجز");
    } catch (e) {
      print("❌ فشل في تحديث الحجز: $e");
    }
  }

  // ✅ 5. حذف حجز
  void deleteBooking(int id) async {
    try {
      final bookingService = BookingService();
      await bookingService.deleteBooking(id);
      print("🗑️ تم حذف الحجز");
    } catch (e) {
      print("❌ فشل في حذف الحجز: $e");
    }
  }

  // ✅ 6. تأكيد حجز
  void confirmBooking(int id) async {
    try {
      final bookingService = BookingService();
      await bookingService.confirmBooking(id);
      print("✅ تم تأكيد الحجز");
    } catch (e) {
      print("❌ فشل في تأكيد الحجز: $e");
    }
  }

  // ✅ 7. إلغاء حجز
  void _cancelBooking(int id) async {
    try {
      final bookingService = BookingService();
      await bookingService.cancelBooking(id);
      print("🛑 تم إلغاء الحجز");
    } catch (e) {
      print("❌ فشل في إلغاء الحجز: $e");
    }
  }
}
