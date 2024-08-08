// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) => Speaker(
      speakers: (json['speakers'] as List<dynamic>)
          .map((e) => SpeakerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'speakers': instance.speakers,
      'pagination': instance.pagination,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalPage: (json['totalPage'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'totalPage': instance.totalPage,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
      'currentPage': instance.currentPage,
    };

SpeakerElement _$SpeakerElementFromJson(Map<String, dynamic> json) =>
    SpeakerElement(
      id: json['id'] as String,
      speakerImage:
          SpeakerImage.fromJson(json['speakerImage'] as Map<String, dynamic>),
      name: json['name'] as String,
      position: json['position'] as String,
      description: json['description'] as String?,
      facebook: json['facebook'] as String,
      twitter: json['twitter'] as String,
      linkedin: json['linkedin'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$SpeakerElementToJson(SpeakerElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'speakerImage': instance.speakerImage,
      'name': instance.name,
      'position': instance.position,
      'description': instance.description,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'status': instance.status,
    };

SpeakerImage _$SpeakerImageFromJson(Map<String, dynamic> json) => SpeakerImage(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpeakerImageToJson(SpeakerImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };
