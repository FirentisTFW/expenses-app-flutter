import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class IconsService {
  static const numberOfIcons = 19;

  static Icon getIconForCategory(int categoryId) {
    final categoriesService = locator<CategoriesService>();

    int iconId = categoriesService.getIconIdForCategory(categoryId);

    return getIconForId(iconId);
  }

  static Icon getIconForId(int iconId) {
    switch (iconId) {
      case 0: // accomodation
        return Icon(MaterialCommunityIcons.home);
      case 1: // alcohol
        return Icon(MaterialCommunityIcons.bottle_wine);
      case 2: // bills
        return Icon(MaterialCommunityIcons.water_pump);
      case 3: // books
        return Icon(FontAwesome.book);
      case 4: // car
        return Icon(MaterialCommunityIcons.car);
      case 5: // cigarettes
        return Icon(MaterialCommunityIcons.smoking);
      case 6: // clothes
        return Icon(MaterialCommunityIcons.tshirt_crew);
      case 7: // debt
        return Icon(MaterialCommunityIcons.bank);
      case 8: // eating out
        return Icon(MaterialCommunityIcons.food);
      case 9: // education
        return Icon(FontAwesome.graduation_cap);
      case 10: // electronics
        return Icon(MaterialCommunityIcons.cellphone);
      case 11: // entertainment
        return Icon(Foundation.ticket);
      case 12: // gifts
        return Icon(MaterialCommunityIcons.gift);
      case 13: // groceries
        return Icon(MaterialCommunityIcons.food_variant);
      case 14: // health care
        return Icon(MaterialCommunityIcons.hospital_box_outline);
      case 15: // hygiene
        return Icon(MaterialCommunityIcons.spray_bottle);
      case 16: // other
        return Icon(FontAwesome.question);
      case 17: // transport
        return Icon(MaterialCommunityIcons.bus);
      case 18: // sport
        return Icon(MaterialCommunityIcons.run);
      default:
        return Icon(FontAwesome.question);
    }
  }
}
