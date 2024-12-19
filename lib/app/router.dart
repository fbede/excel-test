import 'package:excel_test/app/home.dart';
import 'package:excel_test/app/menu.dart';
import 'package:excel_test/app/selection.dart';
import 'package:excel_test/app/vs.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.menu,
      name: Routes.menu,
      builder: (_, __) => const MenuScreen(),
    ),
    GoRoute(
      path: Routes.selection,
      name: Routes.selection,
      builder: (_, __) => const SelectionScreen(),
    ),
    GoRoute(
      path: Routes.vs,
      name: Routes.vs,
      builder: (_, __) => const VsScreen(),
    ),
  ],
);

abstract final class Routes {
  static const home = '/';
  static const menu = '/menu';
  static const selection = '/selection';
  static const vs = '/vs';
}