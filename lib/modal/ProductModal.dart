class Productmodal {
  String? id;
  String? ProductName;
  String? Price;
  String? description;

  Productmodal({
    required this.id,
    required this.ProductName,
    required this.Price,
    required this.description,
  });

  Productmodal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ProductName = json['ProductName'];
    Price = json['Price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ProductName'] = ProductName;
    _data['Price'] = Price;
    _data['description'] = description;
    return _data;
  }
}
