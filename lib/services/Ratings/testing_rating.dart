import 'package:reservation_app/services/Ratings/Rating__services.dart';

class TestingRatingServices {
  void _getAllRatings() async {
    try {
      final ratingService = RatingService();
      final ratings = await ratingService.getAllRatings();
      print("✅ عدد التقييمات: ${ratings.length}");
      for (var rating in ratings) {
        print(
          "⭐ تقييم: ${rating.rating} من العميل ${rating.customerName} للموظف ${rating.workerName}",
        );
      }
    } catch (e) {
      print("❌ فشل في تحميل التقييمات: $e");
    }
  }

  void _createRating() async {
    try {
      final ratingService = RatingService();
      await ratingService.createRating({
        "customer_id": 1,
        "worker_id": 2,
        "booking_id": 3,
        "rating": "4", // ← نفس اللي اشتغل في Postman
        "comments": "Great service!",
      });
      print("✅ تم إرسال التقييم بنجاح");
    } catch (e) {
      print("❌ فشل في إرسال التقييم: $e");
    }
  }
}
