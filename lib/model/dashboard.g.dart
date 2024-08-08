// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      counter: (json['counter'] as List<dynamic>)
          .map((e) => Counter.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogs: (json['blogs'] as List<dynamic>)
          .map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      workshops: (json['workshops'] as List<dynamic>)
          .map((e) => Workshop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'counter': instance.counter,
      'blogs': instance.blogs,
      'events': instance.events,
      'workshops': instance.workshops,
    };

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      featuredImage:
          Image.fromJson(json['featuredImage'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'featuredImage': instance.featuredImage,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

Counter _$CounterFromJson(Map<String, dynamic> json) => Counter(
      title: json['title'] as String,
      number: (json['number'] as num).toInt(),
      icon: json['icon'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$CounterToJson(Counter instance) => <String, dynamic>{
      'title': instance.title,
      'number': instance.number,
      'icon': instance.icon,
      'color': instance.color,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      title: json['title'] as String,
      eventImage: Image.fromJson(json['eventImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'eventImage': instance.eventImage,
    };

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      id: json['id'] as String,
      title: json['title'] as String,
      workshopImage:
          Image.fromJson(json['workshopImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'workshopImage': instance.workshopImage,
    };
