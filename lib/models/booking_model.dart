// ✅ booking_model.dart
class Booking {
  final int id;
  final String name;
  final int customerId;
  final String customerName;
  final int workerId;
  final String workerName;
  final int serviceId;
  final String serviceName;
  final String bookingDate;
  final String startTime;
  final String endTime;
  final double duration;
  final double price;
  final String state;

  Booking({
    required this.id,
    required this.name,
    required this.customerId,
    required this.customerName,
    required this.workerId,
    required this.workerName,
    required this.serviceId,
    required this.serviceName,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.price,
    required this.state,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      name: json['name'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      workerId: json['worker_id'],
      workerName: json['worker_name'],
      serviceId: json['service_id'],
      serviceName: json['service_name'],
      bookingDate: json['booking_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      duration: json['duration']?.toDouble() ?? 0.0,
      price: json['price']?.toDouble() ?? 0.0,
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'customer_id': customerId,
      'customer_name': customerName,
      'worker_id': workerId,
      'worker_name': workerName,
      'service_id': serviceId,
      'service_name': serviceName,
      'booking_date': bookingDate,
      'start_time': startTime,
      'end_time': endTime,
      'duration': duration,
      'price': price,
      'state': state,
    };
  }
}
