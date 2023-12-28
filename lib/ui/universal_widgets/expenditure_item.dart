import 'package:Expenses_app/services/functional_services/icons_service.dart';
import 'package:flutter/material.dart';

class ExpenditureItem extends StatelessWidget {
  final String title;
  final double value;
  final int categoryId;

  const ExpenditureItem({
    super.key,
    required this.title,
    required this.value,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIcon(),
              buildTitle(),
              buildMoneyAmount(),
            ],
          ),
        ),
        const Divider(height: 10)
      ],
    );
  }

  Widget buildIcon() => Expanded(
        flex: 1,
        child: Container(
          child: CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.yellow[400],
            child: IconsService.getIconForCategory(categoryId),
          ),
        ),
      );

  Widget buildTitle() => Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget buildMoneyAmount() => Expanded(
        child: Text(
          value.toStringAsFixed(2),
          style: TextStyle(fontSize: 20, color: Colors.green[600]),
        ),
      );
}
