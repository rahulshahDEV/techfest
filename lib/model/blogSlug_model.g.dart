// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogSlug_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBlogBySlug _$GetBlogBySlugFromJson(Map<String, dynamic> json) =>
    GetBlogBySlug(
      id: json['_id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      featuredImage:
          FeaturedImage.fromJson(json['featuredImage'] as Map<String, dynamic>),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$GetBlogBySlugToJson(GetBlogBySlug instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'excerpt': instance.excerpt,
      'content': instance.content,
      'featuredImage': instance.featuredImage,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

FeaturedImage _$FeaturedImageFromJson(Map<String, dynamic> json) =>
    FeaturedImage(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FeaturedImageToJson(FeaturedImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };
