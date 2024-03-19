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
    required this.assignedDriverId,
    required this.assignedVehicleId,
    required this.status,
    required this.cancelledBy,
    required this.cancelledStatus,
    required this.tripStarted,
    required this.createdAt,
    required this.updatedAt,
    required this.getVehicleBrand,
    required this.getTripDetails,
    required this.getDriver,
    required this.getCar,
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
  final int? assignedDriverId;
  final int? assignedVehicleId;
  final int? status;
  final dynamic cancelledBy;
  final dynamic cancelledStatus;
  final int? tripStarted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final GetVehicleBrand? getVehicleBrand;
  final GetTripDetails? getTripDetails;
  final GetDriver? getDriver;
  final GetCar? getCar;

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
      assignedDriverId: json["assigned_driver_id"],
      assignedVehicleId: json["assigned_vehicle_id"],
      status: json["status"],
      cancelledBy: json["cancelled_by"],
      cancelledStatus: json["cancelled_status"],
      tripStarted: json["trip_started"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      getVehicleBrand: json["get_vehicle_brand"] == null ? null : GetVehicleBrand.fromJson(json["get_vehicle_brand"]),
      getTripDetails: json["get_trip_details"] == null ? null : GetTripDetails.fromJson(json["get_trip_details"]),
      getDriver: json["get_driver"] == null ? null : GetDriver.fromJson(json["get_driver"]),
      getCar: json["get_car"] == null ? null : GetCar.fromJson(json["get_car"]),
    );
  }

}

class GetCar {
  GetCar({
    required this.id,
    required this.partnerId,
    required this.vehicleCategory,
    required this.brand,
    required this.metro,
    required this.metroType,
    required this.metroNo,
    required this.model,
    required this.modelYear,
    required this.vehicleColor,
    required this.aircondition,
    required this.brandName,
    required this.fuelType,
    required this.vehicleFrontPic,
    required this.vehicleBackPic,
    required this.vehiclePlateNo,
    required this.vehicleRegPic,
    required this.vehicleRootPic,
    required this.vehicleFitnessPic,
    required this.vehicleTaxPic,
    required this.vehicleInsurancePic,
    required this.vehicleDrivingFront,
    required this.vehicleDrivingBack,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? partnerId;
  final int? vehicleCategory;
  final int? brand;
  final String? metro;
  final int? metroType;
  final String? metroNo;
  final String? model;
  final String? modelYear;
  final String? vehicleColor;
  final String? aircondition;
  final dynamic brandName;
  final String? fuelType;
  final String? vehicleFrontPic;
  final String? vehicleBackPic;
  final String? vehiclePlateNo;
  final String? vehicleRegPic;
  final String? vehicleRootPic;
  final String? vehicleFitnessPic;
  final String? vehicleTaxPic;
  final String? vehicleInsurancePic;
  final String? vehicleDrivingFront;
  final String? vehicleDrivingBack;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory GetCar.fromJson(Map<String, dynamic> json){
    return GetCar(
      id: json["id"],
      partnerId: json["partner_id"],
      vehicleCategory: json["vehicle_category"],
      brand: json["brand"],
      metro: json["metro"],
      metroType: json["metro_type"],
      metroNo: json["metro_no"],
      model: json["model"],
      modelYear: json["model_year"],
      vehicleColor: json["vehicle_color"],
      aircondition: json["aircondition"],
      brandName: json["brand_name"],
      fuelType: json["fuel_type"],
      vehicleFrontPic: json["vehicle_front_pic"],
      vehicleBackPic: json["vehicle_back_pic"],
      vehiclePlateNo: json["vehicle_plate_no"],
      vehicleRegPic: json["vehicle_reg_pic"],
      vehicleRootPic: json["vehicle_root_pic"],
      vehicleFitnessPic: json["vehicle_fitness_pic"],
      vehicleTaxPic: json["vehicle_tax_pic"],
      vehicleInsurancePic: json["vehicle_insurance_pic"],
      vehicleDrivingFront: json["vehicle_driving_front"],
      vehicleDrivingBack: json["vehicle_driving_back"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class GetDriver {
  GetDriver({
    required this.id,
    required this.partnerId,
    required this.name,
    required this.phone,
    required this.contactNo,
    required this.email,
    required this.gender,
    required this.address,
    required this.drivingNo,
    required this.drivingImage,
    required this.nidFront,
    required this.nidBack,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? partnerId;
  final String? name;
  final String? phone;
  final String? contactNo;
  final String? email;
  final String? gender;
  final String? address;
  final String? drivingNo;
  final String? drivingImage;
  final String? nidFront;
  final String? nidBack;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory GetDriver.fromJson(Map<String, dynamic> json){
    return GetDriver(
      id: json["id"],
      partnerId: json["partner_id"],
      name: json["name"],
      phone: json["phone"],
      contactNo: json["contact_no"],
      email: json["email"],
      gender: json["gender"],
      address: json["address"],
      drivingNo: json["driving_no"],
      drivingImage: json["driving_image"],
      nidFront: json["nid_front"],
      nidBack: json["nid_back"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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
    required this.trackingId,
    required this.status,
    required this.biding,
    required this.bidingExpiredAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? customerId;
  final int? vehicleId;
  final String? pickupLocation;
  final dynamic viaLocation;
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
  final dynamic bidingExpiredAt;
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
      trackingId: json["tracking_id"],
      status: json["status"],
      biding: json["biding"],
      bidingExpiredAt: json["biding_expired_at"],
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
