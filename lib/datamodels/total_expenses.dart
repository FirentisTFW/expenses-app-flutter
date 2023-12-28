import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TotalExpenses extends Equatable {
  final String name;
  final double totalMoneyAmount;

  const TotalExpenses({
    required this.name,
    required this.totalMoneyAmount,
  });

  TotalExpenses.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        totalMoneyAmount = json['totalMoneyAmount'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'totalMoneyAmount': totalMoneyAmount,
      };

  @override
  List<Object> get props => [totalMoneyAmount, name];
}

class TotalCategoryExpenses extends TotalExpenses {
  const TotalCategoryExpenses({
    required String name,
    required double totalMoneyAmount,
  }) : super(
          name: name,
          totalMoneyAmount: totalMoneyAmount,
        );

  TotalCategoryExpenses.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class TotalMonthlyExpenses extends TotalExpenses {
  const TotalMonthlyExpenses({
    required String name,
    required double totalMoneyAmount,
  }) : super(
          name: name,
          totalMoneyAmount: totalMoneyAmount,
        );

  TotalMonthlyExpenses.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
