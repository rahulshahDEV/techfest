// To parse this JSON data, do
//
//     final eventCard = eventCardFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'event_card.g.dart';

EventCard eventCardFromJson(String str) => EventCard.fromJson(json.decode(str));

String eventCardToJson(EventCard data) => json.encode(data.toJson());

@JsonSerializable()
class EventCard {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "link")
  String link;
  @JsonKey(name: "eventImage")
  EventImage eventImage;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  EventCard({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.eventImage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory EventCard.fromJson(Map<String, dynamic> json) =>
      _$EventCardFromJson(json);

  Map<String, dynamic> toJson() => _$EventCardToJson(this);
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
