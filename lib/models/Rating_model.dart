// ✅ rating_model.dart
class Rating {
  final int id;
  final int customerId;
  final String customerName;
  final int workerId;
  final String workerName;
  final int bookingId;
  final String bookingName;
  final String rating; // ممكن تحويله إلى double لو الAPI بتدعمه كرقم
  final String comments;
  final int ticketCount;

  Rating({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.workerId,
    required this.workerName,
    required this.bookingId,
    required this.bookingName,
    required this.rating,
    required this.comments,
    required this.ticketCount,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      workerId: json['worker_id'],
      workerName: json['worker_name'],
      bookingId: json['booking_id'],
      bookingName: json['booking_name'],
      rating: json['rating'],
      comments: json['comments'],
      ticketCount: json['ticket_count'],
    );
  }
}