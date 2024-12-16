import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled3/modal/ProductModal.dart';

class CrudState extends Equatable {
  String? name;
  String? price;
  String? desc;

  CrudState({this.name, this.price, this.desc});

  CrudState copyWith(String? name,String? price,String? desc) {
    return CrudState(name: name ?? this.name,price: price ?? this.price, desc: desc ?? this.desc);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name,price,desc];
}
