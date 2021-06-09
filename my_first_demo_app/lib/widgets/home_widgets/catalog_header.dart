import 'package:flutter/material.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl3.bold.color(context.theme.buttonColor).make(),
        "Trending Products".text.xl.make()
      ],
    );
  }
}
