import 'package:flutter/material.dart';
import 'package:my_first_demo_app/widgets/home_widgets/add_to_cart.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:my_first_demo_app/models/catalog.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "₹${catalog.price}".text.xl4.red500.bold.make(),
              AddToCart(catalog: catalog).wh(125, 50)
            ]).p16(),
      ),
      backgroundColor: MyTheam.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text
                          .color(MyTheam.darkBulishColor)
                          .xl4
                          .bold
                          .make()
                          .pOnly(left: 4.0),
                      catalog.desc.text
                          .textStyle(TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.normal))
                          .xl
                          .make()
                          .pOnly(left: 10.0, right: 10.0),
                      "Sea consetetur diam et at et sadipscing elitr, est sanctus clita sit tempor sanctus takimata ut, nonumy erat amet est diam sadipscing, sit amet consetetur voluptua diam. Sit et clita duo sadipscing amet sadipscing. Takimata et sadipscing voluptua dolores. Clita ipsum accusam gubergren ea dolore sea et kasd diam. Takimata."
                          .text
                          .textStyle(TextStyle(
                              fontSize: 8,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.normal))
                          .make()
                          .pOnly(left: 10.0, right: 10.0, top: 5)
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
