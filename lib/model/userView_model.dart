// To parse this JSON data, do
//
//     final userviewHome = userviewHomeFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'userView_model.g.dart';

UserviewHome userviewHomeFromJson(String str) =>
    UserviewHome.fromJson(json.decode(str));

String userviewHomeToJson(UserviewHome data) => json.encode(data.toJson());

@JsonSerializable()
class UserviewHome {
  @JsonKey(name: "prizes")
  List<Prize> prizes;
  @JsonKey(name: "speakers")
  List<Speaker> speakers;
  @JsonKey(name: "levels")
  List<LevelElement> levels;
  @JsonKey(name: "sponsors")
  List<Sponsor> sponsors;

  UserviewHome({
    required this.prizes,
    required this.speakers,
    required this.levels,
    required this.sponsors,
  });

  factory UserviewHome.fromJson(Map<String, dynamic> json) =>
      _$UserviewHomeFromJson(json);

  Map<String, dynamic> toJson() => _$UserviewHomeToJson(this);
}

@JsonSerializable()
class LevelElement {
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "priority")
  int priority;
  @JsonKey(name: "count")
  int count;

  LevelElement({
    required this.title,
    required this.priority,
    required this.count,
  });

  factory LevelElement.fromJson(Map<String, dynamic> json) =>
      _$LevelElementFromJson(json);

  Map<String, dynamic> toJson() => _$LevelElementToJson(this);
}

@JsonSerializable()
class Prize {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "prizeImage")
  Image prizeImage;
  @JsonKey(name: "description")
  String description;

  Prize({
    required this.id,
    required this.title,
    required this.prizeImage,
    required this.description,
  });

  factory Prize.fromJson(Map<String, dynamic> json) => _$PrizeFromJson(json);

  Map<String, dynamic> toJson() => _$PrizeToJson(this);
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
class Speaker {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "position")
  String position;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "speakerImage")
  Image speakerImage;
  @JsonKey(name: "facebook")
  String facebook;
  @JsonKey(name: "twitter")
  String twitter;
  @JsonKey(name: "linkedin")
  String linkedin;

  Speaker({
    required this.id,
    required this.name,
    required this.position,
    required this.description,
    required this.speakerImage,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}

@JsonSerializable()
class Sponsor {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "sponsorImage")
  Image sponsorImage;
  @JsonKey(name: "level")
  SponsorLevel? level;
  @JsonKey(name: "link")
  String link;
  @JsonKey(name: "description")
  String description;

  Sponsor({
    required this.name,
    required this.sponsorImage,
    required this.level,
    required this.link,
    required this.description,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorToJson(this);
}

@JsonSerializable()
class SponsorLevel {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "title")
  String title;

  SponsorLevel({
    required this.id,
    required this.title,
  });

  factory SponsorLevel.fromJson(Map<String, dynamic> json) =>
      _$SponsorLevelFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorLevelToJson(this);
}
