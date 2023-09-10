class Product {
  String? name;
  String? quantity;
  String? image;
  String? price;

  Product({this.name, this.quantity, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    image = json['image'];
     price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
