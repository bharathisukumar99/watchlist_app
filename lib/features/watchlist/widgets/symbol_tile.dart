import 'package:flutter/material.dart';
import 'package:watchlist_app/features/watchlist/dataModel/symbol_model.dart';

class SymbolTile extends StatelessWidget {
  const SymbolTile({
    super.key,
    required this.data,
  });

  final SymbolModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      children: [
        Row(
          children: [
            Text(data.name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            Spacer(),
            Icon(
              data.isPositiveChange
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
              color: data.isPositiveChange
                  ? Theme.of(context).colorScheme.primary
                  : Colors.red.shade900,
            ),
            Text(data.price.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: data.isPositiveChange
                      ? Theme.of(context).colorScheme.primary
                      : Colors.red.shade900,
                ))
          ],
        ),
        Row(
          children: [
            Text(
              data.exchange,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            if (data.quantity != null)
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.business_center_outlined,
                      size: 12,
                    ),
                    Text(
                      (data.quantity ?? 0).toStringAsFixed(0),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            Spacer(),
            Text(
                "${data.change > 0 ? "+" : ""}${data.change.toStringAsFixed(2)} (${data.changePercentage.toStringAsFixed(2)}%)",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),
          ],
        ),
      ],
    );
  }
}
