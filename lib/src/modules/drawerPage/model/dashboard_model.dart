class DashboardModel {
  DashboardModel({
    this.status,
     this.data,
  });

  final String? status;
  final Data? data;

  factory DashboardModel.fromJson(Map<String, dynamic> json){
    return DashboardModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
     this.totalBids,
     this.totalWaitingBid,
     this.totalCompleteTrip,
     this.totalCar,
     this.earning,
     this.totalDriver,
  });

  final int? totalBids;
  final int? totalWaitingBid;
  final int? totalCompleteTrip;
  final int? totalCar;
  final int? earning;
  final int? totalDriver;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      totalBids: json["totalBids"],
      totalWaitingBid: json["totalWaitingBid"],
      totalCompleteTrip: json["totalCompleteTrip"],
      totalCar: json["totalCar"],
      earning: json["earning"],
      totalDriver: json["totalDriver"],
    );
  }

}
