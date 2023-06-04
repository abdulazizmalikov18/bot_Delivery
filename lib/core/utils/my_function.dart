class MyFunctions {
  static String getThousandsSeparatedPrice(String price) {
    var priceInText = '';
    var counter = 0;
    for (var i = price.length - 1; i >= 0; i--) {
      counter++;
      var str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = '$str$priceInText';
      } else if (i == 0) {
        priceInText = '$str$priceInText';
      } else {
        priceInText = ' $str$priceInText';
      }
    }
    return priceInText.trim();
  }

  static String getFormatCost(String cost) {
    if (cost.isEmpty) return '';
    var oldCost = cost;
    if (cost.contains('.')) {
      final arr = cost.split('.');
      oldCost = arr.first;
    }
    var newCost = '';
    for (var i = 0; i < oldCost.length; i++) {
      if ((oldCost.length - i) % 3 == 0) newCost += ' ';
      newCost += oldCost[i];
    }
    return newCost.trimLeft();
  }
}
