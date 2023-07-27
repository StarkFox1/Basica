import 'package:basica/model/groceries.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    Key? key,
    required this.product,
    required this.canAdd,
    this.onTap,
    this.onUpdateCount,
  }) : super(key: key);

  final GroceryItem product;
  final bool canAdd;
  final Function? onTap;
  final Function(int)? onUpdateCount;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void _add() async {
    if (widget.onTap == null) return;
    updateAddingStatus(true);
    await widget.onTap!();
    updateAddingStatus(false);
  }

  bool adding = false;

  void updateAddingStatus(bool v) {
    setState(() {
      adding = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.blueGrey.shade50,
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(widget.product.imagePath),
        ),
        title: Text(
          widget.product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        trailing: !widget.canAdd
            ? CounterButton(
                loading: false,
                onChange: (int val) {
                  if (val >= 0) widget.onUpdateCount?.call(val);
                },
                count: widget.product.quantity,
              )
            : adding
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => _add(),
                    child: const Icon(Icons.add),
                  ),
        //subtitle: Text('${product.quantity}'),
      ),
    );
  }
}
