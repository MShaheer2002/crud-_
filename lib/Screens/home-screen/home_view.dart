import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled3/Screens/home-screen/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Node JS Application",
              style: GoogleFonts.urbanist(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/create-screen");
                    },
                    child: Text("Create")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/read-screen");
                    },
                    child: Text("Read")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/update-screen");
                    },
                    child: Text("Update")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/delete-screen");
                    },
                    child: Text("Delete")),
              ],
            ),
          ),
        );
      },
    );
  }
}
