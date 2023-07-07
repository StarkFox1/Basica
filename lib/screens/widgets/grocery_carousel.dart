import 'package:basica/model/groceries.dart';
import 'package:basica/screens/groceries_screen.dart';
import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';

class Grocery_carousel extends StatelessWidget {
  const Grocery_carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Favourite Items',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoItems.length,
              itemBuilder: (BuildContext context, int index) {
                GroceryItem groceries = demoItems[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Groceriesscreen(groceries: groceries),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210,
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Positioned(
                        bottom: 35.0,
                        child: Container(
                          height: 180,
                          width: 200,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${groceries.name}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0))
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180,
                                  width: 180.0,
                                  image: AssetImage(groceries.imagePath),
                                ),
                              )
                            ],
                          ))
                    ]),
                  ),
                );
              }),
        )
      ],
    );
  }
}
