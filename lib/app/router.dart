import 'package:Expenses_app/ui/views/home/home_view.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_view.dart';
import 'package:Expenses_app/ui/views/trends_view/trends_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: ListOfExpendituresView),
    MaterialRoute(page: TrendsView),
  ],
)
class $Router {}
