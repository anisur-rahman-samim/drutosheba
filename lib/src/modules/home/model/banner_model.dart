class BannerModel {
  BannerModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Banners> data;

  factory BannerModel.fromJson(Map<String, dynamic> json){
    return BannerModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Banners>.from(json["data"]!.map((x) => Banners.fromJson(x))),
    );
  }

}

class Banners {
  Banners({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.status,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final int? status;
  final int? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Banners.fromJson(Map<String, dynamic> json){
    return Banners(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      status: json["status"],
      type: json["type"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
