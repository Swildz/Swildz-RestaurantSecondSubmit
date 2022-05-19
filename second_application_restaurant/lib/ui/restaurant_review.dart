import 'package:flutter/material.dart';
import '/data/model/detail.dart';

class RestaurantReview extends StatelessWidget {
  final Restaurant restaurant;
  // ignore: use_key_in_widget_constructors
  const RestaurantReview({required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Customer Review"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: restaurant.customerReviews.length,
          itemBuilder: (context, index) {
            final listReview = restaurant.customerReviews[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.blueGrey,
                        size: 30.0,
                      ),
                      Text(
                        listReview.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(" "),
                      Text(
                        listReview.date,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Text(
                    listReview.review,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
