import 'package:flutter/material.dart';

abstract class TotalExpenses {
  final int totalMoneyAmount;
  final String name;

  TotalExpenses(this.totalMoneyAmount, this.name);
}

class TotalMonthlyExpenses extends TotalExpenses {
  TotalMonthlyExpenses({@required int totalMoneyAmount, @required String name})
      : super(totalMoneyAmount, name);
}

class TotalCategoryExpenses extends TotalExpenses {
  TotalCategoryExpenses({@required int totalMoneyAmount, @required String name})
      : super(totalMoneyAmount, name);
}
