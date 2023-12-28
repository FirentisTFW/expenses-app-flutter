import 'package:equatable/equatable.dart';

class Expenditure extends Equatable {
  final int categoryId;
  final DateTime date;
  final int id;
  final double moneyAmount;
  final String name;

  const Expenditure({
    required this.categoryId,
    required this.date,
    required this.id,
    required this.moneyAmount,
    required this.name,
  });

  Expenditure.fromJson(Map<String, dynamic> json)
      : categoryId = json['categoryId'],
        date = DateTime.parse(json['expDate']),
        id = json['id'],
        moneyAmount = json['moneyAmount'],
        name = json['expName'];

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'expDate': date.toIso8601String(),
        'expName': name,
        'id': id,
        'moneyAmount': moneyAmount,
      };

  @override
  List<Object> get props => [id, categoryId, name, moneyAmount, date];
}
