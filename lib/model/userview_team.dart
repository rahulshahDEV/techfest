// To parse this JSON data, do
//
//     final userviewTeam = userviewTeamFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'userview_team.g.dart';

UserviewTeam userviewTeamFromJson(String str) =>
    UserviewTeam.fromJson(json.decode(str));

String userviewTeamToJson(UserviewTeam data) => json.encode(data.toJson());

@JsonSerializable()
class UserviewTeam {
  @JsonKey(name: "members")
  List<Member> members;
  @JsonKey(name: "roles")
  List<RoleElement> roles;

  UserviewTeam({
    required this.members,
    required this.roles,
  });

  factory UserviewTeam.fromJson(Map<String, dynamic> json) =>
      _$UserviewTeamFromJson(json);

  Map<String, dynamic> toJson() => _$UserviewTeamToJson(this);
}

@JsonSerializable()
class Member {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "memberImage")
  MemberImage memberImage;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "role")
  MemberRole role;
  @JsonKey(name: "leader")
  bool leader;
  @JsonKey(name: "description")
  String description;

  Member({
    required this.id,
    required this.memberImage,
    required this.name,
    required this.email,
    required this.role,
    required this.leader,
    required this.description,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

@JsonSerializable()
class MemberImage {
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;

  MemberImage({
    required this.url,
    required this.name,
  });

  factory MemberImage.fromJson(Map<String, dynamic> json) =>
      _$MemberImageFromJson(json);

  Map<String, dynamic> toJson() => _$MemberImageToJson(this);
}

@JsonSerializable()
class MemberRole {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "level")
  int level;

  MemberRole({
    required this.id,
    required this.title,
    required this.level,
  });

  factory MemberRole.fromJson(Map<String, dynamic> json) =>
      _$MemberRoleFromJson(json);

  Map<String, dynamic> toJson() => _$MemberRoleToJson(this);
}

@JsonSerializable()
class RoleElement {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "level")
  int level;
  @JsonKey(name: "count")
  int count;

  RoleElement({
    required this.id,
    required this.title,
    required this.level,
    required this.count,
  });

  factory RoleElement.fromJson(Map<String, dynamic> json) =>
      _$RoleElementFromJson(json);

  Map<String, dynamic> toJson() => _$RoleElementToJson(this);
}
