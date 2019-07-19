import 'package:flutter/material.dart';
import 'package:food_feedback/model/FoodItem.dart';
import 'package:food_feedback/service/FoodItemService.dart';

import 'FoodDetail.dart';

class FoodList extends StatefulWidget {

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {

  var foodItems = List<FoodItem>();

  @override
  void initState() {
    foodItems = _loadFoodItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food list'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetail(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(
            title: Text(foodItems[index].name),
            subtitle: Text(foodItems[index].description),
          );
        }, itemCount: foodItems.length,),
      ),
    );
  }

  void _loadFoodItems() {
    print('Loading food items');
    FoodItemService.getAllFoodItems()
        .then((foodItem){
          setState(() {
            foodItems = foodItem;
          });
        });
  }
}
