class ConfirmedTripsModel {
  ConfirmedTripsModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<ConfirmedTrips> data;

  factory ConfirmedTripsModel.fromJson(Map<String, dynamic> json){
    return ConfirmedTripsModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<ConfirmedTrips>.from(json["data"]!.map((x) => ConfirmedTrips.fromJson(x))),
    );
  }

}

class ConfirmedTrips {
  ConfirmedTrips({
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
    required this.cancelledStatus,
    required this.tripStarted,
    required this.createdAt,
    required this.updatedAt,
    required this.getVehicleBrand,
    required this.getTripDetails,
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
  final dynamic cancelledBy;
  final dynamic cancelledStatus;
  final int? tripStarted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final GetVehicleBrand? getVehicleBrand;
  final GetTripDetails? getTripDetails;

  factory ConfirmedTrips.fromJson(Map<String, dynamic> json){
    return ConfirmedTrips(
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
      cancelledStatus: json["cancelled_status"],
      tripStarted: json["trip_started"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      getVehicleBrand: json["get_vehicle_brand"] == null ? null : GetVehicleBrand.fromJson(json["get_vehicle_brand"]),
      getTripDetails: json["get_trip_details"] == null ? null : GetTripDetails.fromJson(json["get_trip_details"]),
    );
  }

}

class GetTripDetails {
  GetTripDetails({
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
  });

  final int? id;
  final int? customerId;
  final int? vehicleId;
  final String? pickupLocation;
  final String? viaLocation;
  final String? dropoffLocation;
  final dynamic addressId;
  final String? map;
  final dynamic dropoffMap;
  final dynamic districtId;
  final dynamic portId;
  final String? datetime;
  final int? roundTrip;
  final String? promoKey;
  final String? roundDatetime;
  final dynamic note;
  final int? status;
  final int? biding;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory GetTripDetails.fromJson(Map<String, dynamic> json){
    return GetTripDetails(
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
    );
  }

}

class GetVehicleBrand {
  GetVehicleBrand({
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

  factory GetVehicleBrand.fromJson(Map<String, dynamic> json){
    return GetVehicleBrand(
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
