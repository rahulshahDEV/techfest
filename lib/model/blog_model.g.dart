// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      blogs: (json['blogs'] as List<dynamic>)
          .map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'blogs': instance.blogs,
      'pagination': instance.pagination,
    };

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String,
      featuredImage:
          FeaturedImage.fromJson(json['featuredImage'] as Map<String, dynamic>),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'excerpt': instance.excerpt,
      'featuredImage': instance.featuredImage,
      'status': _$StatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$StatusEnumMap = {
  Status.DRAFT: 'Draft',
  Status.PUBLISHED: 'Published',
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
