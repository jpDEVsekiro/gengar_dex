enum CardImageQuality {
  low,
  high,
  empty;

  @override
  String toString() {
    switch (this) {
      case CardImageQuality.low:
        return '/low.webp';
      case CardImageQuality.high:
        return '/high.webp';
      case CardImageQuality.empty:
        return '';
    }
  }
}
