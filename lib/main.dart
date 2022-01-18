import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sampleapp/view/home_view.dart';
import 'package:provider_sampleapp/view/product_view.dart';
import 'package:provider_sampleapp/viewmodel/cart_viewmodel.dart';
import 'package:provider_sampleapp/viewmodel/product_viewmodel.dart';
import 'package:provider_sampleapp/viewmodel/users_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => ProductViewModel()),
        FutureProvider(initialData: null, create: (context) =>UsersViewModel().fetchUsers()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
