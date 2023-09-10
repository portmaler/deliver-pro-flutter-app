import 'dart:convert';
import 'package:dilevery/src/model/product.dart';

class Lead {
  int? id;
  String? tracking;
  String? name;
  String? phone;
  String? phone2;
  String? city;
  String? address;
  String? price;
  List<Product>? products;
  String? statusLivrison;

  Lead(
      {this.id,
      this.tracking,
      this.name,
      this.phone,
      this.phone2,
      this.city,
      this.address,
      this.price,
      this.products,
      this.statusLivrison});

  Lead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tracking = json['tracking'];
    name = json['name'];
    phone = json['phone'];
    phone2 = json['phone2'];
    city = json['city'];
    address = json['address'];
    price = json['price'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
    statusLivrison = json['status_livrison'];
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tracking'] = this.tracking;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone2'] = this.phone2;
    data['city'] = this.city;
    data['address'] = this.address;
    data['price'] = this.price;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['status_livrison'] = this.statusLivrison;
    return data;
  }
}