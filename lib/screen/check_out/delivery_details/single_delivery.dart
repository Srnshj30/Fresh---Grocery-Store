import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

class SingleDelivery extends StatelessWidget {
  final String title;
  final String address;
  final String addressType;
  final String number;
  const SingleDelivery(
      {super.key,
      required this.title,
      required this.address,
      required this.addressType,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                // height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: taskbarColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    addressType,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: taskbarColor,
            radius: 8,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(address),
              const SizedBox(
                height: 2,
              ),
              Text(number),
            ],
          ),
        ),
        const Divider(
          height: 35,
        )
      ],
    );
  }
}
