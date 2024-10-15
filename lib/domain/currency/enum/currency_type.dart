enum CurrencyType {
  fiat('fiat'),
  crypto('crypto'),
  all('');

  const CurrencyType(this.value);

  final String value;
}
