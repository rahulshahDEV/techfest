// To parse this JSON data, do
//
//     final speaker = speakerFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'speaker.g.dart';

Speaker speakerFromJson(String str) => Speaker.fromJson(json.decode(str));

String speakerToJson(Speaker data) => json.encode(data.toJson());

@JsonSerializable()
class Speaker {
  @JsonKey(name: "speakers")
  List<SpeakerElement> speakers;
  @JsonKey(name: "pagination")
  Pagination pagination;

  Speaker({
    required this.speakers,
    required this.pagination,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
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

@JsonSerializable()
class SpeakerElement {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "speakerImage")
  SpeakerImage speakerImage;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "position")
  String position;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "facebook")
  String facebook;
  @JsonKey(name: "twitter")
  String twitter;
  @JsonKey(name: "linkedin")
  String linkedin;
  @JsonKey(name: "status")
  String status;

  SpeakerElement({
    required this.id,
    required this.speakerImage,
    required this.name,
    required this.position,
    this.description,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.status,
  });

  factory SpeakerElement.fromJson(Map<String, dynamic> json) =>
      _$SpeakerElementFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerElementToJson(this);
}

@JsonSerializable()
class SpeakerImage {
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;

  SpeakerImage({
    required this.url,
    required this.name,
  });

  factory SpeakerImage.fromJson(Map<String, dynamic> json) =>
      _$SpeakerImageFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerImageToJson(this);
}
