import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  bool isBool = false;
  SingleItem({required this.isBool, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Image.asset('assets/potato.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 85,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: Text(
                              "Product Name",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "50\$",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '50 Grams',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                '50 Grams',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 17),
                      child: isBool == false
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                height: 10,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "ADD",
                                        style: TextStyle(color: taskbarColor),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 18,
                                        color: taskbarColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "ADD",
                                          style: TextStyle(color: taskbarColor),
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: 18,
                                          color: taskbarColor,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                ),
              ),
            ],
          ),
        ),
        isBool == true
            ? const Divider(
                height: 5,
              )
            : Container(),
      ],
    );
  }
}
