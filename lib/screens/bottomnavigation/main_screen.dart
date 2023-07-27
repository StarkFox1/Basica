import 'package:basica/controllers/products_controller.dart';
import 'package:basica/screens/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Choose Your Items',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetX<ProductsController>(
                  init: Get.put<ProductsController>(ProductsController()),
                  builder: (productController) {
                    if (productController.globalProducts.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: productController.globalProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = productController.globalProducts[index];
                        final alreadyAdded =
                            productController.existInPersonalProducts(product);
                        return ProductItem(
                          product: product,
                          canAdd: !alreadyAdded,
                          onTap: () async {
                            await productController
                                .addToPersonalProducts(product);
                            setState(() {});
                          },
                          onUpdateCount: (count) =>
                              productController.updatePersonalProduct(
                                  product.copyWith(quantity: count)),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
