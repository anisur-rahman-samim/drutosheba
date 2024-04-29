class FareBidDetailsModel {
  FareBidDetailsModel({
     this.status,
     this.data,
  });

  final String? status;
  final Data? data;

  factory FareBidDetailsModel.fromJson(Map<String, dynamic> json){
    return FareBidDetailsModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
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
    required this.otp,
    required this.isConfirm,
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
  final int? otp;
  final int? isConfirm;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
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
      otp: json["otp"],
      isConfirm: json["is_confirm"],
    );
  }

}
