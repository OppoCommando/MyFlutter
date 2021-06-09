import 'package:flutter/material.dart';
import 'package:my_first_demo_app/Pages/home_details_page.dart';
import 'package:my_first_demo_app/models/catalog.dart';
import 'package:my_first_demo_app/widgets/home_widgets/catalog_item.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetails(catalog: catalog),
                    ),
                  )
                },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
