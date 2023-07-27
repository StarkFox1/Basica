import 'package:basica/controllers/products_controller.dart';

import 'package:basica/screens/widgets/personal_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  bool updating = false;

  void updateStatus(bool v) {
    setState(() {
      updating = v;
    });
  }

  void markAsPurchased() async {
    if (updating) return;
    updateStatus(true);
    final cleared =
        await ProductsController.instance.clearPersonalProductsQuantity();
    updateStatus(false);
    if (cleared) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: updating
      //     ? null
      //     : FloatingActionButton.extended(
      //         onPressed: () => markAsPurchased(),
      //         label: const Text('Mark as Purchased'),
      //       ),
      body: updating
          ? const Center(child: CircularProgressIndicator())
          : GetX<ProductsController>(
              init: Get.put<ProductsController>(ProductsController()),
              builder: (productController) {
                if (productController.personalProducts.isEmpty) {
                  return const Center(
                      child: Text('Add you groceries to list here'));
                }
                return ListView.builder(
                  itemCount: productController.personalProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = productController.personalProducts[index];
                    return PersonalProductItem(
                      product: product,
                      onUpdateCount: (count) =>
                          productController.updatePersonalProduct(
                              product.copyWith(quantity: count)),
                    );
                  },
                );
              }),
    );
  }
}
