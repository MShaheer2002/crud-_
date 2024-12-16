import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled3/common/Widgets.dart';
import 'package:untitled3/modal/ProductModal.dart';

import '../../common/services/api.dart';

class ReadView extends StatelessWidget {
  const ReadView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "READ",
          style: GoogleFonts.urbanist(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: FutureBuilder(
            future: Api.fatchProductData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text("No data"),
                );
              } else {
                List<Productmodal>? list = snapshot.data;
                return ListView.builder(
                  itemCount: list!.length,
                  itemBuilder: (context, index) {
                    return ReadProductWidget(
                      list[index].ProductName,
                      list[index].description,
                      list[index].Price,
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
