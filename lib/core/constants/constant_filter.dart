import '../models/model_dropdown.dart';

class ConstantFilter {
  static ConstantFilter? _instance;
  static ConstantFilter getInstance() => _instance ??= ConstantFilter();
  static void refresh() => _instance = null;

  final tl = ModelDropdown(id: 1, title: 'TRY - TL');
  final btc = ModelDropdown(id: 2, title: 'Bitcoin - BTC');
  final usd = ModelDropdown(id: 3, title: 'TetherUS - USD');

  final List<ModelDropdown> _filterList = [];

  ConstantFilter() {
    _filterList.addAll([
      tl,
      btc,
      usd,
    ]);
  }

  List<ModelDropdown> get filterList => _filterList;
}
