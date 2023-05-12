import 'package:get/get.dart';

class ReceipeScanResultController extends GetxController {
  final foodList = [
    {
      "name": "Steamed Chicken",
      "calorie": "145",
      "img":
          "https://www.chinasichuanfood.com/wp-content/uploads/2014/09/steamed-chicken-recipe-4th-1-500x375.jpg"
    },
    {
      "name": "Veggie Pasta",
      "calorie": "120",
      "img":
          "https://www.budgetbytes.com/wp-content/uploads/2021/07/Quick-Veggie-Pasta-fork.jpg"
    },
    {
      "name": "Yellow Juice",
      "calorie": "75",
      "img":
          "https://downshiftology.com/wp-content/uploads/2020/03/Jamu-Juice-Turmeric-Ginger-Drink-5-500x375.jpg"
    },
    {
      "name": "Mixie Pancake",
      "calorie": "100",
      "img":
          "https://www.kitchenathoskins.com/wp-content/uploads/2022/06/oat-flour-pancakes-16.jpg"
    },
    {
      "name": "Steamed Chicken",
      "calorie": "145",
      "img":
          "https://www.chinasichuanfood.com/wp-content/uploads/2014/09/steamed-chicken-recipe-4th-1-500x375.jpg"
    },
    {
      "name": "Veggie Pasta",
      "calorie": "120",
      "img":
          "https://www.budgetbytes.com/wp-content/uploads/2021/07/Quick-Veggie-Pasta-fork.jpg"
    },
    {
      "name": "Yellow Juice",
      "calorie": "75",
      "img":
          "https://downshiftology.com/wp-content/uploads/2020/03/Jamu-Juice-Turmeric-Ginger-Drink-5-500x375.jpg"
    },
    {
      "name": "Mixie Pancake",
      "calorie": "100",
      "img":
          "https://www.kitchenathoskins.com/wp-content/uploads/2022/06/oat-flour-pancakes-16.jpg"
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
