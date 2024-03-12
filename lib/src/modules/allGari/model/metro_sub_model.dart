class MetroSubModel {
  MetroSubModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<MetroSub> data;

  factory MetroSubModel.fromJson(Map<String, dynamic> json){
    return MetroSubModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<MetroSub>.from(json["data"]!.map((x) => MetroSub.fromJson(x))),
    );
  }

}

class MetroSub {
  MetroSub({
    required this.id,
    required this.metroSubName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? metroSubName;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MetroSub.fromJson(Map<String, dynamic> json){
    return MetroSub(
      id: json["id"],
      metroSubName: json["metro_sub_name"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
