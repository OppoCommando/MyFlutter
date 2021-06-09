import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_demo_app/Pages/cart_page.dart';
import 'package:my_first_demo_app/store/store.dart';
import 'package:my_first_demo_app/utils/routes.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education Application ',
      theme: MyTheam.lightTheam(context),
      themeMode: ThemeMode.system,
      darkTheme: MyTheam.darkTheam(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => MyCartPage(),
      },
    );
  }
}
