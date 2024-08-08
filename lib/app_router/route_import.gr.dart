// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:byrahul/pages/Blog.dart' as _i2;
import 'package:byrahul/pages/blog_detail.dart' as _i1;
import 'package:byrahul/pages/blogeditor.dart' as _i3;
import 'package:byrahul/pages/choose_route.dart' as _i4;
import 'package:byrahul/pages/customEditor.dart' as _i5;
import 'package:byrahul/pages/dashboard_page.dart' as _i6;
import 'package:byrahul/pages/event_page.dart' as _i7;
import 'package:byrahul/pages/homescreen.dart' as _i8;
import 'package:byrahul/pages/speaker.dart' as _i9;
import 'package:byrahul/pages/userview/user_detailed.dart' as _i10;
import 'package:byrahul/pages/userview/user_homepage.dart' as _i11;
import 'package:byrahul/pages/wrapper.dart' as _i12;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    BlogDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BlogDetailRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BlogDetail(
          key: args.key,
          slug: args.slug,
          imagepath: args.imagepath,
        ),
      );
    },
    BlogPageRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BlogPage(),
      );
    },
    BlogeditorRoute.name: (routeData) {
      final args = routeData.argsAs<BlogeditorRouteArgs>(
          orElse: () => const BlogeditorRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.Blogeditor(
          key: args.key,
          slug: args.slug,
          imgUrl: args.imgUrl,
          id: args.id,
        ),
      );
    },
    ChooseRouteRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChooseRoute(),
      );
    },
    CustomEditorPageRoute.name: (routeData) {
      final args = routeData.argsAs<CustomEditorPageRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CustomEditorPage(
          key: args.key,
          appbarTitle: args.appbarTitle,
          id: args.id,
          event: args.event,
          imagePath: args.imagePath,
          linkExist: args.linkExist,
        ),
      );
    },
    DashboardPageRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DashboardPage(),
      );
    },
    EventPageRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EventPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HomeScreen(key: args.key),
      );
    },
    SpeakerPageRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SpeakerPage(),
      );
    },
    UserDetailedRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailedRouteArgs>(
          orElse: () => const UserDetailedRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.UserDetailed(
          key: args.key,
          id: args.id,
          count: args.count,
          description: args.description,
          facebook: args.facebook,
          imagePath: args.imagePath,
          position: args.position,
          linkedin: args.linkedin,
          maxline: args.maxline,
          priority: args.priority,
          name: args.name,
          title: args.title,
          tag: args.tag,
          twitter: args.twitter,
          lin: args.lin,
          type: args.type,
        ),
      );
    },
    UserHomepageRoute.name: (routeData) {
      final args = routeData.argsAs<UserHomepageRouteArgs>(
          orElse: () => const UserHomepageRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.UserHomepage(key: args.key),
      );
    },
    WrapperRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.Wrapper(),
      );
    },
  };
}

/// generated route for
/// [_i1.BlogDetail]
class BlogDetailRoute extends _i13.PageRouteInfo<BlogDetailRouteArgs> {
  BlogDetailRoute({
    _i14.Key? key,
    required String slug,
    required String imagepath,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          BlogDetailRoute.name,
          args: BlogDetailRouteArgs(
            key: key,
            slug: slug,
            imagepath: imagepath,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogDetailRoute';

  static const _i13.PageInfo<BlogDetailRouteArgs> page =
      _i13.PageInfo<BlogDetailRouteArgs>(name);
}

class BlogDetailRouteArgs {
  const BlogDetailRouteArgs({
    this.key,
    required this.slug,
    required this.imagepath,
  });

  final _i14.Key? key;

  final String slug;

  final String imagepath;

  @override
  String toString() {
    return 'BlogDetailRouteArgs{key: $key, slug: $slug, imagepath: $imagepath}';
  }
}

/// generated route for
/// [_i2.BlogPage]
class BlogPageRoute extends _i13.PageRouteInfo<void> {
  const BlogPageRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BlogPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogPageRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Blogeditor]
class BlogeditorRoute extends _i13.PageRouteInfo<BlogeditorRouteArgs> {
  BlogeditorRoute({
    _i14.Key? key,
    String? slug,
    String? imgUrl,
    String? id,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          BlogeditorRoute.name,
          args: BlogeditorRouteArgs(
            key: key,
            slug: slug,
            imgUrl: imgUrl,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogeditorRoute';

  static const _i13.PageInfo<BlogeditorRouteArgs> page =
      _i13.PageInfo<BlogeditorRouteArgs>(name);
}

class BlogeditorRouteArgs {
  const BlogeditorRouteArgs({
    this.key,
    this.slug,
    this.imgUrl,
    this.id,
  });

  final _i14.Key? key;

  final String? slug;

  final String? imgUrl;

  final String? id;

  @override
  String toString() {
    return 'BlogeditorRouteArgs{key: $key, slug: $slug, imgUrl: $imgUrl, id: $id}';
  }
}

/// generated route for
/// [_i4.ChooseRoute]
class ChooseRouteRoute extends _i13.PageRouteInfo<void> {
  const ChooseRouteRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ChooseRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseRouteRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CustomEditorPage]
class CustomEditorPageRoute
    extends _i13.PageRouteInfo<CustomEditorPageRouteArgs> {
  CustomEditorPageRoute({
    _i14.Key? key,
    required String appbarTitle,
    String? id,
    bool event = false,
    String imagePath = '',
    bool linkExist = false,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CustomEditorPageRoute.name,
          args: CustomEditorPageRouteArgs(
            key: key,
            appbarTitle: appbarTitle,
            id: id,
            event: event,
            imagePath: imagePath,
            linkExist: linkExist,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomEditorPageRoute';

  static const _i13.PageInfo<CustomEditorPageRouteArgs> page =
      _i13.PageInfo<CustomEditorPageRouteArgs>(name);
}

class CustomEditorPageRouteArgs {
  const CustomEditorPageRouteArgs({
    this.key,
    required this.appbarTitle,
    this.id,
    this.event = false,
    this.imagePath = '',
    this.linkExist = false,
  });

  final _i14.Key? key;

  final String appbarTitle;

  final String? id;

  final bool event;

  final String imagePath;

  final bool linkExist;

  @override
  String toString() {
    return 'CustomEditorPageRouteArgs{key: $key, appbarTitle: $appbarTitle, id: $id, event: $event, imagePath: $imagePath, linkExist: $linkExist}';
  }
}

/// generated route for
/// [_i6.DashboardPage]
class DashboardPageRoute extends _i13.PageRouteInfo<void> {
  const DashboardPageRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardPageRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EventPage]
class EventPageRoute extends _i13.PageRouteInfo<void> {
  const EventPageRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EventPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventPageRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeScreenRoute extends _i13.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i13.PageInfo<HomeScreenRouteArgs> page =
      _i13.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.SpeakerPage]
class SpeakerPageRoute extends _i13.PageRouteInfo<void> {
  const SpeakerPageRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SpeakerPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpeakerPageRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.UserDetailed]
class UserDetailedRoute extends _i13.PageRouteInfo<UserDetailedRouteArgs> {
  UserDetailedRoute({
    _i14.Key? key,
    String? id,
    int? count,
    String? description,
    String? facebook,
    String? imagePath,
    String? position,
    String? linkedin,
    int? maxline,
    String? priority,
    String? name,
    String? title,
    String? tag,
    String? twitter,
    String? lin,
    int? type,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          UserDetailedRoute.name,
          args: UserDetailedRouteArgs(
            key: key,
            id: id,
            count: count,
            description: description,
            facebook: facebook,
            imagePath: imagePath,
            position: position,
            linkedin: linkedin,
            maxline: maxline,
            priority: priority,
            name: name,
            title: title,
            tag: tag,
            twitter: twitter,
            lin: lin,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetailedRoute';

  static const _i13.PageInfo<UserDetailedRouteArgs> page =
      _i13.PageInfo<UserDetailedRouteArgs>(name);
}

class UserDetailedRouteArgs {
  const UserDetailedRouteArgs({
    this.key,
    this.id,
    this.count,
    this.description,
    this.facebook,
    this.imagePath,
    this.position,
    this.linkedin,
    this.maxline,
    this.priority,
    this.name,
    this.title,
    this.tag,
    this.twitter,
    this.lin,
    this.type,
  });

  final _i14.Key? key;

  final String? id;

  final int? count;

  final String? description;

  final String? facebook;

  final String? imagePath;

  final String? position;

  final String? linkedin;

  final int? maxline;

  final String? priority;

  final String? name;

  final String? title;

  final String? tag;

  final String? twitter;

  final String? lin;

  final int? type;

  @override
  String toString() {
    return 'UserDetailedRouteArgs{key: $key, id: $id, count: $count, description: $description, facebook: $facebook, imagePath: $imagePath, position: $position, linkedin: $linkedin, maxline: $maxline, priority: $priority, name: $name, title: $title, tag: $tag, twitter: $twitter, lin: $lin, type: $type}';
  }
}

/// generated route for
/// [_i11.UserHomepage]
class UserHomepageRoute extends _i13.PageRouteInfo<UserHomepageRouteArgs> {
  UserHomepageRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          UserHomepageRoute.name,
          args: UserHomepageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserHomepageRoute';

  static const _i13.PageInfo<UserHomepageRouteArgs> page =
      _i13.PageInfo<UserHomepageRouteArgs>(name);
}

class UserHomepageRouteArgs {
  const UserHomepageRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'UserHomepageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.Wrapper]
class WrapperRoute extends _i13.PageRouteInfo<void> {
  const WrapperRoute({List<_i13.PageRouteInfo>? children})
      : super(
          WrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'WrapperRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
