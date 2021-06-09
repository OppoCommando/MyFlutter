import 'package:velocity_x/velocity_x.dart';

import 'package:my_first_demo_app/models/cart.dart';
import 'package:my_first_demo_app/models/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog = new CatalogModel();
  CartModel cart =new CartModel();

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;    
  }
}
