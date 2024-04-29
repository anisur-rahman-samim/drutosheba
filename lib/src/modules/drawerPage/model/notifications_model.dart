class NotificationsModel {
  NotificationsModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Notifications> data;

  factory NotificationsModel.fromJson(Map<String, dynamic> json){
    return NotificationsModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Notifications>.from(json["data"]!.map((x) => Notifications.fromJson(x))),
    );
  }

}

class Notifications {
  Notifications({
    required this.id,
    required this.partnerId,
    required this.doneBy,
    required this.title,
    required this.body,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? partnerId;
  final dynamic doneBy;
  final String? title;
  final String? body;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Notifications.fromJson(Map<String, dynamic> json){
    return Notifications(
      id: json["id"],
      partnerId: json["partner_id"],
      doneBy: json["done_by"],
      title: json["title"],
      body: json["body"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
