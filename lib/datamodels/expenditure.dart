class Expenditure {
  final int id;
  final int categoryId;
  final String name;
  final double moneyAmount;
  final DateTime date;

  Expenditure(
      {this.id, this.categoryId, this.name, this.moneyAmount, this.date});
}
