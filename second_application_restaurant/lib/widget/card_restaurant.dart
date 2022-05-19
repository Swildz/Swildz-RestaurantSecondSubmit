import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/common/style.dart';
import '/data/model/restaurant.dart';
import '/provider/database_provider.dart';
import '/ui/restaurant_detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  // ignore: use_key_in_widget_constructors
  const CardRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(restaurant.id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              color: primaryColor,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Hero(
                  tag: restaurant.getSmallPicture(),
                  child: Image.network(
                    restaurant.getSmallPicture(),
                    width: 100,
                  ),
                ),
                title: Text(
                  restaurant.name,
                ),
                subtitle: Text(restaurant.city),
                trailing: isBookmarked
                    ? IconButton(
                        icon: const Icon(Icons.favorite),
                        color: favoriteColor,
                        onPressed: () => provider.removeBookmark(restaurant.id),
                      )
                    : IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: favoriteColor,
                        onPressed: () => provider.addBookmark(restaurant),
                      ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RestaurantDetailPage(id: restaurant.id))),
              ),
            );
          },
        );
      },
    );
  }
}
