import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_sampleapp/view/product_view.dart';

import 'user_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider Example'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 50,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductView()),
                  );
                }, child: Text("Product",style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),),
                style: ElevatedButton.styleFrom()),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserView()),
                  );
                }, child: Text("User",style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),),
                    style: ElevatedButton.styleFrom()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
