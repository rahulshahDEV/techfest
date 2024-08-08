// To parse this JSON data, do
//
//     final getBlogBySlug = getBlogBySlugFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'blogSlug_model.g.dart';

GetBlogBySlug getBlogBySlugFromJson(String str) =>
    GetBlogBySlug.fromJson(json.decode(str));

String getBlogBySlugToJson(GetBlogBySlug data) => json.encode(data.toJson());

@JsonSerializable()
class GetBlogBySlug {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "slug")
  String slug;
  @JsonKey(name: "excerpt")
  String excerpt;
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "featuredImage")
  FeaturedImage featuredImage;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  GetBlogBySlug({
    required this.id,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.content,
    required this.featuredImage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory GetBlogBySlug.fromJson(Map<String, dynamic> json) =>
      _$GetBlogBySlugFromJson(json);

  Map<String, dynamic> toJson() => _$GetBlogBySlugToJson(this);
}

@JsonSerializable()
class FeaturedImage {
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;

  FeaturedImage({
    required this.url,
    required this.name,
  });

  factory FeaturedImage.fromJson(Map<String, dynamic> json) =>
      _$FeaturedImageFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedImageToJson(this);
}
