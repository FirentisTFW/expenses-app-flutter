import 'package:flutter/material.dart';

abstract class TotalExpenses {
  final double totalMoneyAmount;
  final String name;

  TotalExpenses(this.totalMoneyAmount, this.name);

  TotalExpenses.fromJson(Map<String, dynamic> json)
      : totalMoneyAmount = json['totalMoneyAmount'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'totalMoneyAmount': totalMoneyAmount,
        'name': name,
      };
}

class TotalMonthlyExpenses extends TotalExpenses {
  TotalMonthlyExpenses(
      {@required double totalMoneyAmount, @required String name})
      : super(totalMoneyAmount, name);

  TotalMonthlyExpenses.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class TotalCategoryExpenses extends TotalExpenses {
  TotalCategoryExpenses(
      {@required double totalMoneyAmount, @required String name})
      : super(totalMoneyAmount, name);

  TotalCategoryExpenses.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
