import 'package:Expenses_app/ui/views/home/home_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
  ],
)
class $Router {}
