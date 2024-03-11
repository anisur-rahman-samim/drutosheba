class FualModel {
  FualModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<FualList> data;

  factory FualModel.fromJson(Map<String, dynamic> json){
    return FualModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<FualList>.from(json["data"]!.map((x) => FualList.fromJson(x))),
    );
  }

}

class FualList {
  FualList({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FualList.fromJson(Map<String, dynamic> json){
    return FualList(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
