import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartTextview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                Provider.of<int>(context).toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
