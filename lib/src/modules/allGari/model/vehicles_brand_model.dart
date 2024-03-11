class VehiclesBrandModel {
  VehiclesBrandModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Datum> data;

  factory VehiclesBrandModel.fromJson(Map<String, dynamic> json){
    return VehiclesBrandModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
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
