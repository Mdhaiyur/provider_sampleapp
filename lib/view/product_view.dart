import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_sampleapp/data/model/product.dart';
import 'package:provider_sampleapp/viewmodel/cart_viewmodel.dart';
import 'package:provider_sampleapp/viewmodel/product_viewmodel.dart';

import '../main.dart';
import 'cart_view.dart';

class ProductView extends StatelessWidget {
  var cartmodel;
  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    cartmodel=CartViewModel();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
          actions: [
            StreamProvider<int>.value(
              initialData: 0,
              value: cartmodel.cartCountStream,
              child: CartTextview(),
            ),
          ],
        ),
        body: Padding(
          child: createProductList(productViewModel),
          padding: EdgeInsets.all(10),
        ));
  }

  createProductList(ProductViewModel productViewModel) {
    if (productViewModel.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (productViewModel.productError != null) {
      return Center(
        child: Image.network('https://dlinkmea.com/images/no-product.png'),
      );
    }
    return ListView.separated(
      itemCount: productViewModel.productList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Product product = productViewModel.productList[index];
        return Row(
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Image.network(
                product.image!,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    product.description!,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12, color: Colors.black38)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '\$${product.price!.toString()}',
              maxLines: 1,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                cartmodel.updateSecond();
              },
              child: const Icon(Icons.add_shopping_cart),
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
