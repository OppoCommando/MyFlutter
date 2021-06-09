import 'package:my_first_demo_app/models/catalog.dart';
import 'package:my_first_demo_app/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
// static final cartMoldel=CartModel._internal();

// CartModel._internal();
// factory CartModel()=>cartMoldel;

  //catalog field
  late CatalogModel _catalog;
  //Collection od ids--store Ids of each items
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  //Get Total Price
  num get getTotalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove cart
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
