import 'package:basica/model/groceries.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

class PersonalProductItem extends StatelessWidget {
  const PersonalProductItem({
    Key? key,
    required this.product,
    this.onUpdateCount,
  }) : super(key: key);

  final GroceryItem product;
  final Function(int)? onUpdateCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListTile(
            tileColor: Colors.blueGrey.shade50,
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(product.imagePath),
            ),
            title: Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            trailing: CounterButton(
              loading: false,
              onChange: (int val) {
                if (val >= 0) onUpdateCount?.call(val);
              },
              count: product.quantity,
            ),
          ),
          if (product.quantity < 3)
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Low Stock',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
