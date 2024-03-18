class HelpModel {
  HelpModel({
     this.status,
    required this.data,
  });

  final String? status;
  final List<Help> data;

  factory HelpModel.fromJson(Map<String, dynamic> json){
    return HelpModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Help>.from(json["data"]!.map((x) => Help.fromJson(x))),
    );
  }

}

class Help {
  Help({
    required this.id,
    required this.helpline,
    required this.email,
    required this.rentalVideoLink,
    required this.returnVideoLink,
    required this.emergencyHelpline,
    required this.visitUs,
    required this.privacyPolicy,
    required this.terms,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? helpline;
  final String? email;
  final String? rentalVideoLink;
  final String? returnVideoLink;
  final String? emergencyHelpline;
  final String? visitUs;
  final String? privacyPolicy;
  final String? terms;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Help.fromJson(Map<String, dynamic> json){
    return Help(
      id: json["id"],
      helpline: json["helpline"],
      email: json["email"],
      rentalVideoLink: json["rental_video_link"],
      returnVideoLink: json["return_video_link"],
      emergencyHelpline: json["emergency_helpline"],
      visitUs: json["visit_us"],
      privacyPolicy: json["privacy_policy"],
      terms: json["terms"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
