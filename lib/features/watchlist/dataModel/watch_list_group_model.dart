// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:uuid/uuid.dart';
import 'package:watchlist_app/features/watchlist/dataModel/symbol_model.dart';

class WatchListGroupModel {
  final String groupId;
  String groupname;
  List<SymbolModel> symbols;
  WatchListGroupModel({
    String? groupId,
    required this.groupname,
    required this.symbols,
  }) : groupId = groupId ?? const Uuid().v4();
}
