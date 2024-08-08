// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCard _$EventCardFromJson(Map<String, dynamic> json) => EventCard(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
      eventImage:
          EventImage.fromJson(json['eventImage'] as Map<String, dynamic>),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$EventCardToJson(EventCard instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'eventImage': instance.eventImage,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

EventImage _$EventImageFromJson(Map<String, dynamic> json) => EventImage(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$EventImageToJson(EventImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };
