import 'package:basica/model/groceries.dart';
import 'package:basica/repos/product_repo.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find<ProductsController>();

  final Rx<List<GroceryItem>> _globalProducts = Rx<List<GroceryItem>>([]);

  List<GroceryItem> get globalProducts {
    List<GroceryItem> products = [];
    for (var p in _globalProducts.value) {
      if (existInPersonalProducts(p)) {
        var personalProduct =
            personalProducts.firstWhere((e) => e.name == p.name);
        products.add(personalProduct);
      } else {
        products.add(p);
      }
    }
    return products;
  }

  final Rx<List<GroceryItem>> _personalProducts = Rx<List<GroceryItem>>([]);

  List<GroceryItem> get personalProducts {
    List<GroceryItem> sortedProducts = _personalProducts.value;
    sortedProducts.sort((a, b) => a.quantity.compareTo(b.quantity));
    return _personalProducts.value;
  }

  @override
  void onReady() {
    _globalProducts.bindStream(ProductRepo.globalProductsStream());
    _personalProducts.bindStream(ProductRepo.personalProductsStream());
  }

  bool existInPersonalProducts(GroceryItem product) {
    bool exist = personalProducts.map((p) => p.name).contains(product.name);
    return exist;
  }

  List<GroceryItem> searchedProducts(String searchText) {
    if (searchText.isEmpty) {
      return globalProducts;
    } else {
      List<GroceryItem> filteredProducts = globalProducts
          .where((item) =>
              item.name.toLowerCase().startsWith(searchText.toLowerCase()))
          .toList();
      filteredProducts.sort((a, b) => a.name.compareTo(b.name));
      return filteredProducts;
    }
  }

  Future<void> addToPersonalProducts(GroceryItem product) async {
    try {
      await ProductRepo.addToPersonalProducts(product);
    } catch (_) {}
  }

  Future<void> updatePersonalProduct(GroceryItem product) async {
    try {
      await ProductRepo.updatePersonalProduct(product);
    } catch (_) {}
  }

  Future<bool> clearPersonalProductsQuantity() async {
    try {
      for (var p in personalProducts) {
        await ProductRepo.updatePersonalProduct(p.copyWith(quantity: 0));
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
