import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled3/CRUD_BLOC/crud_event.dart';
import 'package:untitled3/Screens/update-screen/update_view_modal.dart';
import 'package:untitled3/common/services/api.dart';
import 'package:untitled3/data/productData.dart';

import '../../CRUD_BLOC/crud_bloc.dart';
import '../../CRUD_BLOC/crud_state.dart';
import '../../common/Widgets.dart';
import '../../modal/ProductModal.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  TextEditingController? name;
  TextEditingController? price;
  TextEditingController? desc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    price = TextEditingController();
    desc = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name?.dispose();
    price?.dispose();
    desc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UpdateViewModal(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "UPDATE",
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
                        return UpdateProductWidget(
                            context,
                            list[index].ProductName,
                            list[index].description,
                            list[index].Price,
                            list[index].id.toString(), () {
                          name?.text = list[index].ProductName!;
                          desc?.text  = list[index].description!;
                          price?.text  = list[index].Price!;
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 400,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // name
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: TextField(
                                        controller: name,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 20),
                                          hintText: "Product Name",
                                          hintStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Urbanist",
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey.shade200,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          errorStyle: const TextStyle(
                                              fontFamily: "Urbanist",
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),

                                    // price
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: TextField(
                                        controller: price,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 20),
                                          hintText: "Product Price",
                                          hintStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Urbanist",
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey.shade200,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          errorStyle: const TextStyle(
                                              fontFamily: "Urbanist",
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),

                                    // description
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: TextField(
                                        controller:
                                           desc,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 20),
                                          hintText: "Description",
                                          hintStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Urbanist",
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey.shade200,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          errorStyle: const TextStyle(
                                              fontFamily: "Urbanist",
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),

                                    // submit
                                    Container(
                                      width: 300,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: BlocBuilder<CrudBloc, CrudState>(
                                        builder: (context, state) {
                                          return ElevatedButton(
                                              onPressed: () {
                                                context.read<CrudBloc>().add(
                                                        UpdateProduct(
                                                            list[index].id, {
                                                      "pname": name?.text,
                                                      "pprice": price?.text,
                                                      "pdesc": desc?.text,
                                                    }));
                                                // Api.UpdatedProduct(
                                                //     list[index].id, {
                                                //       'id':list[index].id,
                                                //       'pname':viewModel.titleController.text,
                                                //       'pprice':viewModel.priceController.text,
                                                //       'pdesc':viewModel.subtitleController.text,
                                                // });
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.amber,
                                              ),
                                              child: Center(
                                                child: Text("Submit"),
                                              ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        });
                      },
                    );
                  }
                },
              )),
        );
      },
    );
  }
}
