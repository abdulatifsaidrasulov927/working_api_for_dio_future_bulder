// title": "UAE Dirham",
//     "code": "AED",
//     "cb_price": "3291.49",
//     "nbu_buy_price": null,
//     "nbu_cell_price": null,
//     "date": "09/02/2023 06:00:01 pm"

class currencyModel {
  String title;
  String code;
  String cb_price;
  String date;

  currencyModel({
    required this.cb_price,
    required this.code,
    required this.date,
    required this.title,
  });

  factory currencyModel.fromJson(Map<String, dynamic> json) {
    String title = json['title'] ?? 'No title';
    String code = json['code'] ?? 'No code';
    String date = json['date'] ?? 'No date';
    String cb_price = json['cb_price'] ?? 'No price';
    return currencyModel(
        cb_price: cb_price, code: code, date: date, title: title);
  }
}
