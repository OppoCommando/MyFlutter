import 'package:flutter/material.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  })  : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p4
        .rounded
        .color(MyTheam.creamColor)
        .make()
        .p8()
        .w32(context);
  }
}