
import 'package:food_feedback/common/constants.dart';
import 'package:food_feedback/model/FoodItem.dart';
import 'package:http/http.dart' as http;

class FoodItemService {

  static Future<List<FoodItem>> getAllFoodItems() async {
    var response = await http.get(getFoodItemsUrl);
    return foodItemFromJson(response.body);
  }

}