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
    required this.customer,
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
  final Customer? customer;

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
      customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    );
  }

}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.birthday,
    required this.gender,
    required this.district,
    required this.address,
    required this.image,
    required this.verify,
    required this.expireAt,
    required this.forgotCode,
    required this.status,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? birthday;
  final String? gender;
  final dynamic district;
  final String? address;
  final dynamic image;
  final String? verify;
  final DateTime? expireAt;
  final dynamic forgotCode;
  final int? status;
  final dynamic deviceToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      birthday: json["birthday"],
      gender: json["gender"],
      district: json["district"],
      address: json["address"],
      image: json["image"],
      verify: json["verify"],
      expireAt: DateTime.tryParse(json["expire_at"] ?? ""),
      forgotCode: json["forgot_code"],
      status: json["status"],
      deviceToken: json["device_token"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
