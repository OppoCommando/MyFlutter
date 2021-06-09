import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_demo_app/models/cart.dart';
import 'package:my_first_demo_app/models/catalog.dart';
import 'package:my_first_demo_app/store/store.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  //final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            AddMutation(catalog);
            // _cart.catalog = _catalog;
            // _cart.add(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheam.darkBulishColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
