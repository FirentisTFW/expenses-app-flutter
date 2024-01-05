import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:flutter/material.dart';

class IconsService {
  static const numberOfIcons = 19;

  static Icon getIconForCategory(int categoryId) {
    final categoriesService = locator<CategoriesService>();

    int iconId = categoriesService.getIconIdForCategory(categoryId);

    return Icon(
      getIconForId(iconId),
      color: Colors.black,
    );
  }

  static IconData getIconForId(int iconId) {
    switch (iconId) {
      case 0: // accomodation
        return Icons.home;
      case 1: // alcohol
        return Icons.wine_bar_rounded;
      case 2: // bills
        return Icons.electric_bolt_rounded;
      case 3: // books
        return Icons.menu_book_rounded;
      case 4: // car
        return Icons.time_to_leave_rounded;
      case 5: // cigarettes
        return Icons.smoking_rooms_rounded;
      case 6: // clothes
        return Icons.dry_cleaning_rounded;
      case 7: // debt
        return Icons.percent;
      case 8: // eating out
        return Icons.local_dining_rounded;
      case 9: // education
        return Icons.school_rounded;
      case 10: // electronics
        return Icons.phone_android_rounded;
      case 11: // entertainment
        return Icons.theaters_rounded;
      case 12: // gifts
        return Icons.card_giftcard_rounded;
      case 13: // groceries
        return Icons.local_grocery_store_rounded;
      case 14: // health care
        return Icons.health_and_safety_rounded;
      case 15: // hygiene
        return Icons.soap_rounded;
      case 16: // other
        return Icons.question_mark_rounded;
      case 17: // transport
        return Icons.train_rounded;
      case 18: // sport
        return Icons.sports_gymnastics_rounded;
      default:
        return Icons.question_mark_rounded;
    }
  }
}
