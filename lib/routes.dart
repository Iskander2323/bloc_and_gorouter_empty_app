import 'package:bloc_and_go_router_empty_app/components/ui/app_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => AppPage(),
    ),
  ],
);
