part of 'route_import.dart';

@override
RouteType get defaultRouteType => const RouteType.material();

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WrapperRoute.page, path: '/wrapper', initial: true),
        AutoRoute(
          page: HomeScreenRoute.page,
          path: '/home',
        ),
        AutoRoute(
          page: UserHomepageRoute.page,
          path: '/userhome',
        ),
        // AutoRoute(page: UserHomeRoute.page, path: '/userhome'),
        // AutoRoute(page: LoginPageRoute.page, path: '/login'),
        AutoRoute(page: BlogPageRoute.page, path: '/blog'),
        AutoRoute(page: DashboardPageRoute.page, path: '/dashboard'),
        AutoRoute(page: SpeakerPageRoute.page, path: '/speaker'),
        AutoRoute(page: CustomEditorPageRoute.page, path: '/customeditor'),
        AutoRoute(page: EventPageRoute.page, path: '/event'),
        AutoRoute(page: UserDetailedRoute.page, path: '/deatiledView'),
        AutoRoute(
          page: BlogeditorRoute.page,
          path: '/editor',
        )
      ];
}
