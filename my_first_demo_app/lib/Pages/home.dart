import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_demo_app/models/cart.dart';
import 'package:my_first_demo_app/store/store.dart';
import 'package:my_first_demo_app/utils/routes.dart';
import 'package:my_first_demo_app/widgets/home_widgets/catalog_header.dart';
import 'package:my_first_demo_app/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:my_first_demo_app/models/catalog.dart';
//import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Apalak Dutta";
  final url = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    // final reponse = await http.get(Uri.parse(url));
    // final catalogJson = reponse.body;

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeCatalog = jsonDecode(catalogJson);
    print(catalogJson);
    var productData = decodeCatalog["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    //final dummyList = List.generate(30, (index) => CatalogModel.items[0]);
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          backgroundColor: context.theme.buttonColor,
        ).badge(
            color: Vx.red400,
            size: 23,
            count: _cart.items.length,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.length > 0)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
