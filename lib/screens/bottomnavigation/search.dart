import 'package:flutter/material.dart';

class Item {
  final String name;
  int quantity;

  Item({required this.name, this.quantity = 0});
}

class Search extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Rice', quantity: 0),
    Item(name: 'Beans', quantity: 0),
    Item(name: 'Chicken', quantity: 0),
    Item(name: 'Apple', quantity: 0),
    Item(name: 'Pen', quantity: 0),
    Item(name: 'Pencil', quantity: 0),
    Item(name: 'Grapes', quantity: 0),
    Item(name: 'Meat', quantity: 0),
    Item(name: 'Mango', quantity: 0),
    Item(name: 'Lemon', quantity: 0),
    Item(name: 'Mango', quantity: 0),
    Item(name: 'Orange', quantity: 0),
    Item(name: 'Papaya', quantity: 0),
    Item(name: 'Quince', quantity: 0),
    Item(name: 'Raspberry', quantity: 0),
    Item(name: 'Strawberry', quantity: 0),
    Item(name: 'Watermelon', quantity: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar with ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(items: items),
    );
  }
}

class SearchScreen extends StatefulWidget {
  final List<Item> items;

  SearchScreen({required this.items});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Item> filteredItems = [];
  Item? selectedItem;
  TextEditingController _searchController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  List<Item> addedItems = [];

  @override
  void initState() {
    super.initState();
  }

  void filterItems(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        filteredItems = [];
      } else {
        filteredItems = widget.items
            .where((item) =>
                item.name.toLowerCase().startsWith(searchText.toLowerCase()))
            .toList();
        filteredItems.sort((a, b) => a.name.compareTo(b.name));
      }
    });
  }

  void selectItem(Item item) {
    setState(() {
      selectedItem = item;
      _quantityController.text = item.quantity.toString();
    });
  }

  void updateQuantity() {
    setState(() {
      selectedItem!.quantity = int.tryParse(_quantityController.text) ?? 0;
      addedItems.add(selectedItem!);
      selectedItem = null;
      _quantityController.text = '';
    });
  }

  void removeItem(Item item) {
    setState(() {
      addedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for Your Items'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      filterItems(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Add Item'),
                                content: TextField(
                                  controller: _quantityController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Enter Quantity',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('Add'),
                                    onPressed: () {
                                      String itemName = _searchController.text;
                                      int quantity = int.tryParse(
                                              _quantityController.text) ??
                                          0;

                                      if (itemName.isNotEmpty) {
                                        Item newItem = Item(
                                            name: itemName, quantity: quantity);
                                        addedItems.add(newItem);
                                      }

                                      _searchController.text = '';
                                      _quantityController.text = '';
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_searchController.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  final isSelected = selectedItem == item;

                  return ListTile(
                    title: Text('${item.name} (${item.quantity})'),
                    trailing: isSelected
                        ? SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      selectedItem = null;
                                      _quantityController.text = '';
                                    });
                                  },
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _quantityController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    onEditingComplete: updateQuantity,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              selectItem(item);
                            },
                          ),
                  );
                },
              ),
            ),
          if (addedItems.isNotEmpty) SizedBox(height: 16),
          if (addedItems.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'My Checklist',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: addedItems.length,
                      itemBuilder: (context, index) {
                        final item = addedItems[index];
                        return ListTile(
                          title: Row(
                            children: [
                              Text('${item.name} (${item.quantity})'),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  removeItem(item);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
