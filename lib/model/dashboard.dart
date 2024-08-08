// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'dashboard.g.dart';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

@JsonSerializable()
class Dashboard {
  @JsonKey(name: "counter")
  List<Counter> counter;
  @JsonKey(name: "blogs")
  List<Blog> blogs;
  @JsonKey(name: "events")
  List<Event> events;
  @JsonKey(name: "workshops")
  List<Workshop> workshops;

  Dashboard({
    required this.counter,
    required this.blogs,
    required this.events,
    required this.workshops,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class Blog {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "slug")
  String slug;
  @JsonKey(name: "featuredImage")
  Image featuredImage;
  @JsonKey(name: "createdAt")
  DateTime createdAt;

  Blog({
    required this.id,
    required this.title,
    required this.slug,
    required this.featuredImage,
    required this.createdAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;

  Image({
    required this.url,
    required this.name,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class Counter {
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "icon")
  String icon;
  @JsonKey(name: "color")
  String color;

  Counter({
    required this.title,
    required this.number,
    required this.icon,
    required this.color,
  });

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Map<String, dynamic> toJson() => _$CounterToJson(this);
}

@JsonSerializable()
class Event {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "eventImage")
  Image eventImage;

  Event({
    required this.id,
    required this.title,
    required this.eventImage,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Workshop {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "workshopImage")
  Image workshopImage;

  Workshop({
    required this.id,
    required this.title,
    required this.workshopImage,
  });

  factory Workshop.fromJson(Map<String, dynamic> json) =>
      _$WorkshopFromJson(json);

  Map<String, dynamic> toJson() => _$WorkshopToJson(this);
}
