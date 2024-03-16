class ReviewsModel {
  ReviewsModel({
     this.status,
     this.data,
  });

  final String? status;
  final Data? data;

  factory ReviewsModel.fromJson(Map<String, dynamic> json){
    return ReviewsModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.averageStar,
    required this.reviewsCount,
  });

  final String? averageStar;
  final int? reviewsCount;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      averageStar: json["average_star"],
      reviewsCount: json["reviews_count"],
    );
  }

}
