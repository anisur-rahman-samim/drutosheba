class PenaltyModel {
  PenaltyModel({
     this.status,
     this.data,
  });

  final String? status;
  final Data? data;

  factory PenaltyModel.fromJson(Map<String, dynamic> json){
    return PenaltyModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.penaltyChart,
    required this.cancelledTrips,
     this.totalCancelled,
     this.penaltyAmount,
  });

  final List<PenaltyChart> penaltyChart;
  final List<CancelledTrip> cancelledTrips;
  final int? totalCancelled;
  final String? penaltyAmount;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      penaltyChart: json["penaltyChart"] == null ? [] : List<PenaltyChart>.from(json["penaltyChart"]!.map((x) => PenaltyChart.fromJson(x))),
      cancelledTrips: json["cancelledTrips"] == null ? [] : List<CancelledTrip>.from(json["cancelledTrips"]!.map((x) => CancelledTrip.fromJson(x))),
      totalCancelled: json["totalCancelled"],
      penaltyAmount: json["penaltyAmount"],
    );
  }

}

class CancelledTrip {
  CancelledTrip({
    required this.id,
    required this.tripId,
    required this.bidId,
    required this.vehicleId,
    required this.customerId,
    required this.partnerId,
    required this.amount,
    required this.otp,
    required this.trackingId,
    required this.status,
    required this.cancelledBy,
    required this.tripStarted,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? tripId;
  final int? bidId;
  final int? vehicleId;
  final int? customerId;
  final int? partnerId;
  final int? amount;
  final int? otp;
  final String? trackingId;
  final int? status;
  final int? cancelledBy;
  final int? tripStarted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CancelledTrip.fromJson(Map<String, dynamic> json){
    return CancelledTrip(
      id: json["id"],
      tripId: json["trip_id"],
      bidId: json["bid_id"],
      vehicleId: json["vehicle_id"],
      customerId: json["customer_id"],
      partnerId: json["partner_id"],
      amount: json["amount"],
      otp: json["otp"],
      trackingId: json["tracking_id"],
      status: json["status"],
      cancelledBy: json["cancelled_by"],
      tripStarted: json["trip_started"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class PenaltyChart {
  PenaltyChart({
    required this.id,
    required this.name,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory PenaltyChart.fromJson(Map<String, dynamic> json){
    return PenaltyChart(
      id: json["id"],
      name: json["name"],
      amount: json["amount"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
