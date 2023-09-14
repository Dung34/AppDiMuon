class CheckinResponse {
  String? dateNow;
  int? workDay;
  int? lateDay;
  int? leaveDay;
  List<String>? listEventCheckin;

  CheckinResponse(
      {this.dateNow,
      this.workDay,
      this.lateDay,
      this.leaveDay,
      this.listEventCheckin});

  CheckinResponse.fromJson(Map<String, dynamic> json) {
    dateNow = json['dateNow'];
    workDay = json['workDay'];
    lateDay = json['lateDay'];
    leaveDay = json['leaveDay'];
    listEventCheckin = json['listEventCheckin'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateNow'] = this.dateNow;
    data['workDay'] = this.workDay;
    data['lateDay'] = this.lateDay;
    data['leaveDay'] = this.leaveDay;
    data['listEventCheckin'] = this.listEventCheckin;
    return data;
  }
}
