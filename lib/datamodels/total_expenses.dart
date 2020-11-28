import 'package:flutter/material.dart';

abstract class TotalExpenses {
  final double totalMoneyAmount;
  final String name;

  TotalExpenses(this.totalMoneyAmount, this.name);
}

class TotalMonthlyExpenses extends TotalExpenses {
  TotalMonthlyExpenses(
      {@required double totalMoneyAmount, @required String name})
      : super(totalMoneyAmount, name);
}

class TotalCategoryExpenses extends TotalExpenses {
  TotalCategoryExpenses(
      {@required double totalMoneyAmount, @required String name})
      : super(totalMoneyAmount, name);
}
