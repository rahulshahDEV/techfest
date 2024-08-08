// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userview_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserviewTeam _$UserviewTeamFromJson(Map<String, dynamic> json) => UserviewTeam(
      members: (json['members'] as List<dynamic>)
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => RoleElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserviewTeamToJson(UserviewTeam instance) =>
    <String, dynamic>{
      'members': instance.members,
      'roles': instance.roles,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as String,
      memberImage:
          MemberImage.fromJson(json['memberImage'] as Map<String, dynamic>),
      name: json['name'] as String,
      email: json['email'] as String,
      role: MemberRole.fromJson(json['role'] as Map<String, dynamic>),
      leader: json['leader'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'memberImage': instance.memberImage,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'leader': instance.leader,
      'description': instance.description,
    };

MemberImage _$MemberImageFromJson(Map<String, dynamic> json) => MemberImage(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberImageToJson(MemberImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

MemberRole _$MemberRoleFromJson(Map<String, dynamic> json) => MemberRole(
      id: json['_id'] as String,
      title: json['title'] as String,
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$MemberRoleToJson(MemberRole instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'level': instance.level,
    };

RoleElement _$RoleElementFromJson(Map<String, dynamic> json) => RoleElement(
      id: json['id'] as String,
      title: json['title'] as String,
      level: (json['level'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$RoleElementToJson(RoleElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'level': instance.level,
      'count': instance.count,
    };
