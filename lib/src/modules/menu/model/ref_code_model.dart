class RefCodeModel {
  RefCodeModel({
     this.status,
     this.data,
  });

  final String? status;
  final Data? data;

  factory RefCodeModel.fromJson(Map<String, dynamic> json){
    return RefCodeModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.phone,
    required this.myreferKey,
  });

  final String? phone;
  final String? myreferKey;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      phone: json["phone"],
      myreferKey: json["myrefer_key"],
    );
  }

}
