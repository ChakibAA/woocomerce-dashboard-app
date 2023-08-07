class Product {
  int? id;
  String? name;
  String? price;
  int? quantity;
  Map<String, dynamic>? variations;
  int? variationId;

  Product(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.variationId,
      this.variations});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    variations = json['variation_attributes'];
    variationId = json['variation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['variation_attributes'] = variations;
    data['variation_id'] = variationId;
    return data;
  }
}
