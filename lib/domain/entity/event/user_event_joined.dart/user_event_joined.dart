import '../../../../data/model/event_response/event_response.dart';

class UserEventJoined {
  String? userId;
  String? username;
  String? eventId;
  EventResponse? events;
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

  UserEventJoined(
      {this.userId,
      this.username,
      this.eventId,
      this.events,
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

  UserEventJoined.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    eventId = json['eventId'];
    events =
        json['events'] != null ? EventResponse.fromJson(json['events']) : null;
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
    data['username'] = username;
    data['eventId'] = eventId;
    if (events != null) {
      data['events'] = events!.toJson();
    }
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
