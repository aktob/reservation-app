class Contract {
  final int id;
  final String name;
  final int customerId;
  final String customerName;
  final int workerId;
  final String workerName;
  final String startTime;
  final String endTime;
  final double totalPrice;
  final String state;
  final String contractType;
  final int durationInMonths;
  final bool isInvoiced;
  final List<VisitDate> visitDates;

  Contract({
    required this.id,
    required this.name,
    required this.customerId,
    required this.customerName,
    required this.workerId,
    required this.workerName,
    required this.startTime,
    required this.endTime,
    required this.totalPrice,
    required this.state,
    required this.contractType,
    required this.durationInMonths,
    required this.isInvoiced,
    required this.visitDates,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      name: json['name'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      workerId: json['worker_id'],
      workerName: json['worker_name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      totalPrice: (json['total_price'] as num).toDouble(),
      state: json['state'],
      contractType: json['contract_type'],
      durationInMonths: json['duration_in_months'],
      isInvoiced: json['is_invoiced'],
      visitDates: (json['visit_dates'] as List)
          .map((e) => VisitDate.fromJson(e))
          .toList(),
    );
  }
}

class VisitDate {
  final int id;
  final String name;
  final String bookingDate;
  final String startTime;
  final String endTime;
  final String state;

  VisitDate({
    required this.id,
    required this.name,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.state,
  });

  factory VisitDate.fromJson(Map<String, dynamic> json) {
    return VisitDate(
      id: json['id'],
      name: json['name'],
      bookingDate: json['booking_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      state: json['state'],
    );
  }
}
