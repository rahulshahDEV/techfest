// To parse this JSON data, do
//
//     final userviewEvent = userviewEventFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'userview_event.g.dart';

List<UserviewEvent> userviewEventFromJson(String str) =>
    List<UserviewEvent>.from(
        json.decode(str).map((x) => UserviewEvent.fromJson(x)));

String userviewEventToJson(List<UserviewEvent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class UserviewEvent {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "eventImage")
  EventImage eventImage;

  UserviewEvent({
    required this.id,
    required this.title,
    required this.eventImage,
  });

  factory UserviewEvent.fromJson(Map<String, dynamic> json) =>
      _$UserviewEventFromJson(json);

  Map<String, dynamic> toJson() => _$UserviewEventToJson(this);
}

@JsonSerializable()
class EventImage {
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;

  EventImage({
    required this.url,
    required this.name,
  });

  factory EventImage.fromJson(Map<String, dynamic> json) =>
      _$EventImageFromJson(json);

  Map<String, dynamic> toJson() => _$EventImageToJson(this);
}
