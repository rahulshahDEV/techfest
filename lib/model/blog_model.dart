// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'blog_model.g.dart';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

@JsonSerializable()
class BlogModel {
  @JsonKey(name: "blogs")
  List<Blog> blogs;
  @JsonKey(name: "pagination")
  Pagination pagination;

  BlogModel({
    required this.blogs,
    required this.pagination,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}

@JsonSerializable()
class Blog {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "slug")
  String slug;
  @JsonKey(name: "excerpt")
  String excerpt;
  @JsonKey(name: "featuredImage")
  FeaturedImage featuredImage;
  @JsonKey(name: "status")
  Status status;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;

  Blog({
    required this.id,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.featuredImage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
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

enum Status {
  @JsonValue("Draft")
  DRAFT,
  @JsonValue("Published")
  PUBLISHED
}

final statusValues =
    EnumValues({"Draft": Status.DRAFT, "Published": Status.PUBLISHED});

@JsonSerializable()
class Pagination {
  @JsonKey(name: "totalPage")
  int totalPage;
  @JsonKey(name: "totalItems")
  int totalItems;
  @JsonKey(name: "itemsPerPage")
  int itemsPerPage;
  @JsonKey(name: "currentPage")
  int currentPage;

  Pagination({
    required this.totalPage,
    required this.totalItems,
    required this.itemsPerPage,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
