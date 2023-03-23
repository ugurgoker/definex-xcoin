enum ThemeApperance { light, dark, system }
enum ActivityState { isLoading, isLoaded, isError }
enum ActivityErrorActionState { none, gotoBack, gotoLogin }

enum AppLanguage {
  locale(-1),
  en(0),
  tr(1);

  const AppLanguage(this.id);
  final int id;

  factory AppLanguage.fromId(int id) {
    return values.firstWhere((e) => e.id == id);
  }
}

enum Flavor {
  prod('prod'),
  dev('dev');

  const Flavor(this.value);
  final String value;
}

enum CoinListType {
  all('ALL'),
  gainers('GAINERS'),
  losers('LOSERS'),
  favourites('FAVORITES');

  const CoinListType(this.value);
  final String value;
}
