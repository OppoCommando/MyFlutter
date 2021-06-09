import 'package:flutter/material.dart';
import 'package:my_first_demo_app/models/cart.dart';
import 'package:my_first_demo_app/store/store.dart';
import 'package:my_first_demo_app/widgets/theams.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
              builder: (context, _, status) {
                return ("₹${_cart.getTotalPrice}"
                    .text
                    .xl5
                    .color(context.theme.hintColor)
                    .make());
              },
              mutations: {RemoveMutation},
              notifications: {}),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet".text.make(),
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Bye".text.make())
              .w32(context)
        ],
      ).pOnly(left: 8, right: 8),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return (_cart.items.length == 0)
        ? "Nothing To Show!!!".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              title: _cart.items[index].name.text.make(),
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  //_cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
            ),
          );
  }
}
