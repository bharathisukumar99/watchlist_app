import 'package:uuid/uuid.dart';

class SymbolModel {
  final String id;
  final String name;
  final String exchange;
  final double price;
  final double change;
  final double changePercentage;
  final int? quantity;
  final bool isPositiveChange;

  SymbolModel({
    String? id,
    required this.name,
    required this.exchange,
    required this.price,
    required this.change,
    required this.changePercentage,
    this.quantity,
  })  : id = id ?? const Uuid().v4(),
        isPositiveChange = change >= 0;
}
