class MetroModel {
  MetroModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Metro> data;

  factory MetroModel.fromJson(Map<String, dynamic> json){
    return MetroModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Metro>.from(json["data"]!.map((x) => Metro.fromJson(x))),
    );
  }

}

class Metro {
  Metro({
    required this.id,
    required this.metroName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? metroName;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Metro.fromJson(Map<String, dynamic> json){
    return Metro(
      id: json["id"],
      metroName: json["metro_name"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
