import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled3/CRUD_BLOC/crud_bloc.dart';
import 'package:untitled3/CRUD_BLOC/crud_event.dart';
import 'package:untitled3/Screens/delete-screen/delete_view_model.dart';

import '../../CRUD_BLOC/crud_state.dart';
import '../../common/Widgets.dart';
import '../../common/services/api.dart';
import '../../modal/ProductModal.dart';

class Deleteview extends StatefulWidget {
  const Deleteview({super.key});

  @override
  State<Deleteview> createState() => _DeleteviewState();
}

class _DeleteviewState extends State<Deleteview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DELETE",
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
                    return BlocBuilder<CrudBloc, CrudState>(
                      builder: (context, state) {
                        return DeleteProductWidget(
                            context,
                            list[index].ProductName,
                            list[index].description,
                            list[index].Price,
                            list[index].id.toString(), () {
                          context
                              .read<CrudBloc>()
                              .add(DeleteProduct(list[index].id.toString()));
                          setState(() {
                            list.removeAt(index);
                          });

                        });
                      },
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
