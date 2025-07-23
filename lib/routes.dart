import 'package:bloc_and_go_router_empty_app/components/app_page/ui/app_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets/animated_grid_view.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets/animated_list_1.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets/animated_list_2.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets/animated_list_3.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets/animated_list_4.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets/animated_list_5.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/animated_widgets_page/animated_widgets_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/custom_scroll_view/custom_scroll_view_example.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/grid_view_page/grid_view_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/list_view_page/ui/list_view_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/scaffold_page/scaffold_page.dart';
import 'package:bloc_and_go_router_empty_app/components/pages/show_case_view_page/show_case_view_page.dart';
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
        GoRoute(
          path: 'scaffold_page',
          name: 'scaffold_page',
          builder: (context, state) => const ScaffoldPage(),
        ),
         GoRoute(
          path: 'custom_scroll_view_example',
          name: 'custom_scroll_view_example',
          builder: (context, state) => const CustomScrollViewExample(),
        ),
         GoRoute(
          path: 'show_case_view_page',
          name: 'show_case_view_page',
          builder: (context, state) => const ShowCaseViewPage(),
        ),
        GoRoute(
          path: 'animated_widgets_page',
          name: 'animated_widgets_page',
          builder: (context, state) => const AnimatedWidgetsPage(),
          routes: [
            GoRoute(path: 'animated_list_1', name: 'animated_list_1', builder: (context, state) => const AnimatedList1()),
            GoRoute(path: 'animated_list_2', name: 'animated_list_2', builder: (context, state) => const AnimatedList2()),
            GoRoute(path: 'animated_list_3', name: 'animated_list_3', builder: (context, state) => const AnimatedList3()),
            GoRoute(path: 'animated_list_4', name: 'animated_list_4', builder: (context, state) => const AnimatedList4()),
            GoRoute(path: 'animated_list_5', name: 'animated_list_5', builder: (context, state) => const AnimatedList5()),
            GoRoute(path: 'animated_grid_view', name: 'animated_grid_view', builder: (context, state) => const AnimatedGridExample()),
          ]
        ),
      ],
    ),
  ],
);
