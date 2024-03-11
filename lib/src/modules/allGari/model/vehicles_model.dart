class VehiclesModel {
  VehiclesModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Datum> data;

  factory VehiclesModel.fromJson(Map<String, dynamic> json){
    return VehiclesModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
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
    );
  }

}
