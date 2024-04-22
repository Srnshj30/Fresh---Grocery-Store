import 'package:flutter/material.dart';

enum Signincharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productAbout;
  final int productPrice;
  const ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productAbout,
    required this.productPrice,
    super.key,
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  Signincharacter _signincharacter = Signincharacter.fill;

  Widget bottomNavigation({
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required Color textColor,
    required IconData iconData,
  }) {
    return Expanded(
      child: Container(
        height: 60,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigation(
            iconColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 124, 124, 122),
            title: 'Add to WishList',
            textColor: Colors.white,
            iconData: Icons.favorite_outline,
          ),
          bottomNavigation(
            iconColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 130, 172, 194),
            title: 'Add to Cart',
            textColor: Colors.white,
            iconData: Icons.shopping_bag_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 172, 194),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(221, 255, 255, 255)),
        title: Text(
          widget.productName,
          style: const TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 25),
                      child: Text(
                        widget.productName,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Rs ${widget.productPrice}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(widget.productImage),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 17, top: 10),
                      width: double.infinity,
                      child: const Text(
                        'Available Options',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 7.0),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              Radio(
                                value: Signincharacter.fill,
                                groupValue: _signincharacter,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    _signincharacter = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text(
                            'Rs ${widget.productPrice}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Container(
                            height: 60,
                            width: 101,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                Text(
                                  'ADD',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.productAbout,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
