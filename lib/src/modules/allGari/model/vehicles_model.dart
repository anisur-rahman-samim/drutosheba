class VehiclesModel {
  VehiclesModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Vehicles> data;

  factory VehiclesModel.fromJson(Map<String, dynamic> json){
    return VehiclesModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Vehicles>.from(json["data"]!.map((x) => Vehicles.fromJson(x))),
    );
  }

}

class Vehicles {
  Vehicles({
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
    required this.getbrand,
    required this.getcategory,
    required this.partnerinfo,
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
  final GetBrand? getbrand;
  final GetBrand? getcategory;
  final Partnerinfo? partnerinfo;

  factory Vehicles.fromJson(Map<String, dynamic> json){
    return Vehicles(
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
      getbrand: json["getbrand"] == null ? null : GetBrand.fromJson(json["getbrand"]),
      getcategory: json["getcategory"] == null ? null : GetBrand.fromJson(json["getcategory"]),
      partnerinfo: json["partnerinfo"] == null ? null : Partnerinfo.fromJson(json["partnerinfo"]),
    );
  }

}

class GetBrand {
  GetBrand({
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

  factory GetBrand.fromJson(Map<String, dynamic> json){
    return GetBrand(
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

class Partnerinfo {
  Partnerinfo({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.docType,
    required this.docNumber,
    required this.docFront,
    required this.docBack,
    required this.division,
    required this.address,
    required this.gender,
    required this.referCode,
    required this.myreferKey,
    required this.verify,
    required this.forgotCode,
    required this.credit,
    required this.debit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? image;
  final String? docType;
  final String? docNumber;
  final String? docFront;
  final String? docBack;
  final dynamic division;
  final String? address;
  final String? gender;
  final dynamic referCode;
  final String? myreferKey;
  final String? verify;
  final String? forgotCode;
  final int? credit;
  final int? debit;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Partnerinfo.fromJson(Map<String, dynamic> json){
    return Partnerinfo(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      image: json["image"],
      docType: json["doc_type"],
      docNumber: json["doc_number"],
      docFront: json["doc_front"],
      docBack: json["doc_back"],
      division: json["division"],
      address: json["address"],
      gender: json["gender"],
      referCode: json["refer_code"],
      myreferKey: json["myrefer_key"],
      verify: json["verify"],
      forgotCode: json["forgot_code"],
      credit: json["credit"],
      debit: json["debit"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
