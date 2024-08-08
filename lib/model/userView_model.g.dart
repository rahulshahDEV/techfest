// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userView_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserviewHome _$UserviewHomeFromJson(Map<String, dynamic> json) => UserviewHome(
      prizes: (json['prizes'] as List<dynamic>)
          .map((e) => Prize.fromJson(e as Map<String, dynamic>))
          .toList(),
      speakers: (json['speakers'] as List<dynamic>)
          .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
          .toList(),
      levels: (json['levels'] as List<dynamic>)
          .map((e) => LevelElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      sponsors: (json['sponsors'] as List<dynamic>)
          .map((e) => Sponsor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserviewHomeToJson(UserviewHome instance) =>
    <String, dynamic>{
      'prizes': instance.prizes,
      'speakers': instance.speakers,
      'levels': instance.levels,
      'sponsors': instance.sponsors,
    };

LevelElement _$LevelElementFromJson(Map<String, dynamic> json) => LevelElement(
      title: json['title'] as String,
      priority: (json['priority'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$LevelElementToJson(LevelElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'priority': instance.priority,
      'count': instance.count,
    };

Prize _$PrizeFromJson(Map<String, dynamic> json) => Prize(
      id: json['id'] as String,
      title: json['title'] as String,
      prizeImage: Image.fromJson(json['prizeImage'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$PrizeToJson(Prize instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'prizeImage': instance.prizeImage,
      'description': instance.description,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

Speaker _$SpeakerFromJson(Map<String, dynamic> json) => Speaker(
      id: json['id'] as String,
      name: json['name'] as String,
      position: json['position'] as String,
      description: json['description'] as String,
      speakerImage:
          Image.fromJson(json['speakerImage'] as Map<String, dynamic>),
      facebook: json['facebook'] as String,
      twitter: json['twitter'] as String,
      linkedin: json['linkedin'] as String,
    );

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'description': instance.description,
      'speakerImage': instance.speakerImage,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
    };

Sponsor _$SponsorFromJson(Map<String, dynamic> json) => Sponsor(
      name: json['name'] as String,
      sponsorImage:
          Image.fromJson(json['sponsorImage'] as Map<String, dynamic>),
      level: json['level'] == null
          ? null
          : SponsorLevel.fromJson(json['level'] as Map<String, dynamic>),
      link: json['link'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SponsorToJson(Sponsor instance) => <String, dynamic>{
      'name': instance.name,
      'sponsorImage': instance.sponsorImage,
      'level': instance.level,
      'link': instance.link,
      'description': instance.description,
    };

SponsorLevel _$SponsorLevelFromJson(Map<String, dynamic> json) => SponsorLevel(
      id: json['_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SponsorLevelToJson(SponsorLevel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };
