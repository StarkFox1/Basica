import 'package:basica/controllers/products_controller.dart';
import 'package:basica/screens/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetX<ProductsController>(
                init: Get.put<ProductsController>(ProductsController()),
                builder: (productController) {
                  final searchedProducts = productController
                      .searchedProducts(_searchController.text);
                  if (_searchController.text.isEmpty) {
                    return const Center(
                      child: Text('Please type something to search!'),
                    );
                  }
                  if (searchedProducts.isEmpty) {
                    return const Text('Sorry:) No products found!');
                  }
                  return ListView.builder(
                    itemCount: searchedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = searchedProducts[index];
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
          )
        ],
      ),
    );
  }
}
