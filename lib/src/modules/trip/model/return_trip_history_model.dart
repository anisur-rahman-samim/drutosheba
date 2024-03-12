class ReturnTripModel {
  ReturnTripModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<ReturnTrip> data;

  factory ReturnTripModel.fromJson(Map<String, dynamic> json){
    return ReturnTripModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<ReturnTrip>.from(json["data"]!.map((x) => ReturnTrip.fromJson(x))),
    );
  }

}

class ReturnTrip {
  ReturnTrip({
    required this.id,
    required this.pickupDivision,
    required this.dropoffDivision,
    required this.location,
    required this.destination,
    required this.amount,
    required this.timedate,
    required this.partnerId,
    required this.vehicleId,
    required this.biding,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? pickupDivision;
  final int? dropoffDivision;
  final String? location;
  final String? destination;
  final String? amount;
  final String? timedate;
  final int? partnerId;
  final int? vehicleId;
  final int? biding;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ReturnTrip.fromJson(Map<String, dynamic> json){
    return ReturnTrip(
      id: json["id"],
      pickupDivision: json["pickup_division"],
      dropoffDivision: json["dropoff_division"],
      location: json["location"],
      destination: json["destination"],
      amount: json["amount"],
      timedate: json["timedate"],
      partnerId: json["partner_id"],
      vehicleId: json["vehicle_id"],
      biding: json["biding"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
