class AllTripsModel {
  AllTripsModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<AllTripsData> data;

  factory AllTripsModel.fromJson(Map<String, dynamic> json){
    return AllTripsModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<AllTripsData>.from(json["data"]!.map((x) => AllTripsData.fromJson(x))),
    );
  }

}

class AllTripsData {
  AllTripsData({
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
    required this.trackingId,
    required this.status,
    required this.biding,
    required this.bidingExpiredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.iscomplete,
    required this.tripStarted,
    required this.cancelledBy,
    required this.assignedDriverId,
    required this.assignedVehicleId,
    required this.brand,
    required this.metro,
    required this.metroNo,
    required this.vehicleFrontPic,
    required this.brandName,
    required this.model,
    required this.metroSubName,
    required this.name,
    required this.phone,
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
  final dynamic promoKey;
  final String? roundDatetime;
  final dynamic note;
  final String? trackingId;
  final int? status;
  final int? biding;
  final DateTime? bidingExpiredAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? iscomplete;
  final int? tripStarted;
  final dynamic cancelledBy;
  final int? assignedDriverId;
  final int? assignedVehicleId;
  final int? brand;
  final String? metro;
  final String? metroNo;
  final String? vehicleFrontPic;
  final String? brandName;
  final String? model;
  final String? metroSubName;
  final String? name;
  final String? phone;
  final Vehicle? vehicle;

  factory AllTripsData.fromJson(Map<String, dynamic> json){
    return AllTripsData(
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
      trackingId: json["tracking_id"],
      status: json["status"],
      biding: json["biding"],
      bidingExpiredAt: DateTime.tryParse(json["biding_expired_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      iscomplete: json["iscomplete"],
      tripStarted: json["trip_started"],
      cancelledBy: json["cancelled_by"],
      assignedDriverId: json["assigned_driver_id"],
      assignedVehicleId: json["assigned_vehicle_id"],
      brand: json["brand"],
      metro: json["metro"],
      metroNo: json["metro_no"],
      vehicleFrontPic: json["vehicle_front_pic"],
      brandName: json["brand_name"],
      model: json["model"],
      metroSubName: json["metro_sub_name"],
      name: json["name"],
      phone: json["phone"],
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
