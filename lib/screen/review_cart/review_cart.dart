import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

import '../../single_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

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
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleItem(isBool: true),
            SingleItem(isBool: true),
            SingleItem(isBool: true),
            SingleItem(isBool: true),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
