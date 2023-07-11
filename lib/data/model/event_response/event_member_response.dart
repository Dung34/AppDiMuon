class EventMemberResponse {
  String? userId;
  String? eventId;
  String? eventTitle;
  String? avatar;
  String? fullname;
  String? checkedInLocation;
  String? checkedInDate;
  String? id;
  String? createdBy;
  String? createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;

  EventMemberResponse(
      {this.userId,
      this.eventId,
      this.eventTitle,
      this.avatar,
      this.fullname,
      this.checkedInLocation,
      this.checkedInDate,
      this.id,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate});

  EventMemberResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    eventId = json['eventId'];
    eventTitle = json['eventTitle'];
    avatar = json['avatar'];
    fullname = json['fullname'];
    checkedInLocation = json['checkedInLocation'];
    checkedInDate = json['checkedInDate'];
    id = json['id'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['eventId'] = eventId;
    data['eventTitle'] = eventTitle;
    data['avatar'] = avatar;
    data['fullname'] = fullname;
    data['checkedInLocation'] = checkedInLocation;
    data['checkedInDate'] = checkedInDate;
    data['id'] = id;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    data['lastModifiedBy'] = lastModifiedBy;
    data['lastModifiedDate'] = lastModifiedDate;
    return data;
  }
}
