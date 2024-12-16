import 'package:flutter/material.dart';

Widget ReadProductWidget(String? title, String? subtitle, String? price) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Card(
      child: ListTile(
        title: Text(title!),
        subtitle: Text(subtitle!),
        leading: Icon(Icons.ad_units_outlined),
        trailing: Text(price!),
      ),
    ),
  );
}

Widget UpdateProductWidget(BuildContext context, String? title, String? subtitle,
    String? price, String? id, VoidCallback fun) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Card(
      child: ListTile(
        title: Text(title!),
        subtitle: Text(subtitle!),
        leading: Text(price!),
        trailing: IconButton(
            onPressed: () {
              fun();
            },
            icon: Icon(Icons.edit)),
      ),
    ),
  );
}

Widget DeleteProductWidget(BuildContext context, String? title, String? subtitle,
    String? price, String? id, VoidCallback fun) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Card(
      child: ListTile(
        title: Text(title!),
        subtitle: Text(subtitle!),
        leading: Text(price!),
        trailing: IconButton(
            onPressed: () {
              fun();
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    ),
  );
}
