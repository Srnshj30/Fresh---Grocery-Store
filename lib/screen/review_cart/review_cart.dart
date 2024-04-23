import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

import '../../widgets/single_item.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({super.key});

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Total Amount',
              style: TextStyle(fontSize: 18),
            ),
          ),
          subtitle: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '\$ 170',
              style: TextStyle(fontSize: 15),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: MaterialButton(
                onPressed: () {},
                color: taskbarColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text('Review Cart'),
          backgroundColor: taskbarColor,
        ),
        body: ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
