import 'package:Expenses_app/ui/universal_widgets/loading_spinner.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_view.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? LoadingSpinner()
            : PageTransitionSwitcher(
                duration: const Duration(milliseconds: 400),
                reverse: model.reverse,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                  );
                },
                child: getViewForIndex(model.currentIndex),
              ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            const BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            const BottomNavigationBarItem(
              label: 'Expenses',
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
      onModelReady: (model) => model.initialise(),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return ThisMonthChartView();
      case 1:
        return LastExpendituresView();
      default:
        return ThisMonthChartView();
    }
  }
}
