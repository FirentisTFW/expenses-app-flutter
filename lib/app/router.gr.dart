// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/list_of_expenditures/list_of_expenditures_view.dart';
import '../ui/views/new_expenditure/new_expenditure_view.dart';
import '../ui/views/trends/trends_view.dart';

class Routes {
  static const String homeView = '/';
  static const String listOfExpendituresView = '/list-of-expenditures-view';
  static const String trendsView = '/trends-view';
  static const String newExpenditureView = '/new-expenditure-view';
  static const all = <String>{
    homeView,
    listOfExpendituresView,
    trendsView,
    newExpenditureView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.listOfExpendituresView, page: ListOfExpendituresView),
    RouteDef(Routes.trendsView, page: TrendsView),
    RouteDef(Routes.newExpenditureView, page: NewExpenditureView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ListOfExpendituresView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ListOfExpendituresView(),
        settings: data,
      );
    },
    TrendsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TrendsView(),
        settings: data,
      );
    },
    NewExpenditureView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewExpenditureView(),
        settings: data,
      );
    },
  };
}
