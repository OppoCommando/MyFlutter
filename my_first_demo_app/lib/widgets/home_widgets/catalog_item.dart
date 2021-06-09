import 'package:flutter/material.dart';
import 'package:my_first_demo_app/models/cart.dart';
import 'package:my_first_demo_app/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:my_first_demo_app/models/catalog.dart';
import 'package:my_first_demo_app/widgets/home_widgets/catalog_image.dart';
import 'package:my_first_demo_app/widgets/theams.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text
                .color(MyTheam.darkBulishColor)
                .lg
                .bold
                .make()
                .pOnly(left: 4.0),
            catalog.desc.text
                .textStyle(TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.normal))
                .make()
                .pOnly(left: 4.0, right: 4.0),
            ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "₹${catalog.price}"
                      .text
                      .xl
                      .bold
                      .color(context.theme.accentColor)
                      .make(),
                  AddToCart(catalog: catalog)
                ]).pOnly(right: 8.0, left: 4.0, top: 2.0)
          ],
        ).p4())
      ],
    )).color(context.theme.cardColor).roundedSM.square(115).make().py4();
  }
}


