class FareTripModel {
  FareTripModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<FareTrip> data;

  factory FareTripModel.fromJson(Map<String, dynamic> json){
    return FareTripModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<FareTrip>.from(json["data"]!.map((x) => FareTrip.fromJson(x))),
    );
  }

}

class FareTrip {
  FareTrip({
    required this.id,
    required this.partnerTripId,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.map,
    required this.dropoffMap,
    required this.price,
    required this.customerId,
    required this.returnTripId,
    required this.partnerId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? partnerTripId;
  final String? pickupLocation;
  final String? dropoffLocation;
  final String? map;
  final String? dropoffMap;
  final String? price;
  final int? customerId;
  final int? returnTripId;
  final int? partnerId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FareTrip.fromJson(Map<String, dynamic> json){
    return FareTrip(
      id: json["id"],
      partnerTripId: json["partner_trip_id"],
      pickupLocation: json["pickup_location"],
      dropoffLocation: json["dropoff_location"],
      map: json["map"],
      dropoffMap: json["dropoff_map"],
      price: json["price"],
      customerId: json["customer_id"],
      returnTripId: json["return_trip_id"],
      partnerId: json["partner_id"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
