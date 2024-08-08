// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'event_model.g.dart';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

@JsonSerializable()
class EventModel {
  @JsonKey(name: "events")
  List<Event> events;
  @JsonKey(name: "pagination")
  Pagination pagination;

  EventModel({
    required this.events,
    required this.pagination,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}

@JsonSerializable()
class Event {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "link")
  String link;
  @JsonKey(name: "eventImage")
  EventImage eventImage;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;

  Event({
    required this.id,
    required this.title,
    required this.link,
    required this.eventImage,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
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

@JsonSerializable()
class Pagination {
  @JsonKey(name: "totalPage")
  int totalPage;
  @JsonKey(name: "totalItems")
  int totalItems;
  @JsonKey(name: "itemsPerPage")
  int itemsPerPage;
  @JsonKey(name: "currentPage")
  int currentPage;

  Pagination({
    required this.totalPage,
    required this.totalItems,
    required this.itemsPerPage,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
