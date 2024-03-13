class TripRequestModel {
  TripRequestModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<TripRequest> data;

  factory TripRequestModel.fromJson(Map<String, dynamic> json){
    return TripRequestModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<TripRequest>.from(json["data"]!.map((x) => TripRequest.fromJson(x))),
    );
  }

}

class TripRequest {
  TripRequest({
    required this.id,
    required this.customerId,
    required this.vehicleId,
    required this.pickupLocation,
    required this.viaLocation,
    required this.dropoffLocation,
    required this.addressId,
    required this.map,
    required this.dropoffMap,
    required this.districtId,
    required this.portId,
    required this.datetime,
    required this.roundTrip,
    required this.promoKey,
    required this.roundDatetime,
    required this.note,
    required this.status,
    required this.biding,
    required this.createdAt,
    required this.updatedAt,
    required this.vehicle,
  });

  final int? id;
  final int? customerId;
  final int? vehicleId;
  final String? pickupLocation;
  final String? viaLocation;
  final String? dropoffLocation;
  final dynamic addressId;
  final String? map;
  final String? dropoffMap;
  final dynamic districtId;
  final dynamic portId;
  final String? datetime;
  final int? roundTrip;
  final String? promoKey;
  final String? roundDatetime;
  final String? note;
  final int? status;
  final int? biding;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Vehicle? vehicle;

  factory TripRequest.fromJson(Map<String, dynamic> json){
    return TripRequest(
      id: json["id"],
      customerId: json["customer_id"],
      vehicleId: json["vehicle_id"],
      pickupLocation: json["pickup_location"],
      viaLocation: json["via_location"],
      dropoffLocation: json["dropoff_location"],
      addressId: json["address_id"],
      map: json["map"],
      dropoffMap: json["dropoff_map"],
      districtId: json["district_id"],
      portId: json["port_id"],
      datetime: json["datetime"],
      roundTrip: json["round_trip"],
      promoKey: json["promo_key"],
      roundDatetime: json["round_datetime"],
      note: json["note"],
      status: json["status"],
      biding: json["biding"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      vehicle: json["vehicle"] == null ? null : Vehicle.fromJson(json["vehicle"]),
    );
  }

}

class Vehicle {
  Vehicle({
    required this.id,
    required this.vehicleCategory,
    required this.name,
    required this.nameBn,
    required this.slug,
    required this.capacity,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? vehicleCategory;
  final String? name;
  final String? nameBn;
  final String? slug;
  final String? capacity;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Vehicle.fromJson(Map<String, dynamic> json){
    return Vehicle(
      id: json["id"],
      vehicleCategory: json["vehicle_category"],
      name: json["name"],
      nameBn: json["name_bn"],
      slug: json["slug"],
      capacity: json["capacity"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
