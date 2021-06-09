import 'package:flutter/material.dart';
import 'package:my_first_demo_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "₹${item.price}",
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          print("${item.name}");
        },
      ),
    );
  }
}
