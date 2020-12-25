class Expenditure {
  final int id;
  final int categoryId;
  final String name;
  final double moneyAmount;
  final DateTime date;

  Expenditure(
      {this.id, this.categoryId, this.name, this.moneyAmount, this.date});

  Expenditure.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        categoryId = json['categoryId'],
        name = json['expName'],
        moneyAmount = json['moneyAmount'],
        date = DateTime.tryParse(json['expDate']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'categoryId': categoryId,
        'expName': name,
        'moneyAmount': moneyAmount,
        'expDate': date.toIso8601String(),
      };
}
