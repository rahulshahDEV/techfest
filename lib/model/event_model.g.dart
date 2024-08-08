// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'events': instance.events,
      'pagination': instance.pagination,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      title: json['title'] as String,
      link: json['link'] as String,
      eventImage:
          EventImage.fromJson(json['eventImage'] as Map<String, dynamic>),
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'eventImage': instance.eventImage,
      'description': instance.description,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
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
