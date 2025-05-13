import 'package:bloc_and_go_router_empty_app/components/app_page/ui/app_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/grid_view_page/grid_view_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/list_view_page/ui/list_view_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/text_widgets/text_widgets_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/widgets_page/widgets_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => AppPage(),
      routes: [
        GoRoute(
          path: 'widgets_page',
          name: 'widgets_page',
          builder: (context, state) => const WidgetsPage(),
        ),
        GoRoute(
          path: 'list_view_page',
          name: 'list_view_page',
          builder: (context, state) => const ListViewPage(),
        ),
        GoRoute(
          path: 'grid_view_page',
          name: 'grid_view_page',
          builder: (context, state) => const GridViewPage(),
        ),
        GoRoute(
          path: 'text_widgets_page',
          name: 'text_widgets_page',
          builder: (context, state) => const TextWidgetsPage(),
        ),
      ],
    ),
  ],
);
