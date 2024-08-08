// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userview_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserviewEvent _$UserviewEventFromJson(Map<String, dynamic> json) =>
    UserviewEvent(
      id: json['id'] as String,
      title: json['title'] as String,
      eventImage:
          EventImage.fromJson(json['eventImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserviewEventToJson(UserviewEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'eventImage': instance.eventImage,
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
