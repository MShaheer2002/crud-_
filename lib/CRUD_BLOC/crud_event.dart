import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled3/modal/ProductModal.dart';

abstract class CrudEvent extends Equatable {}

class CreateProduct extends CrudEvent {
  String? name;
  String? price;
  String? desc;

  CreateProduct({this.name, this.price, this.desc});

  @override
  // TODO: implement props
  List<Object?> get props => [name, price, desc];
}

class ReadProduct extends CrudEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateProduct extends CrudEvent {
  String? id;
  Map<String, dynamic>? data;

  UpdateProduct(this.id, this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [id, data];
}

class DeleteProduct extends CrudEvent {
  String? id;

  DeleteProduct(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
