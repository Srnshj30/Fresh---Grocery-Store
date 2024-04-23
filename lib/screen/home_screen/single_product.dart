import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/widgets/count.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function() onTap;
  const SingleProduct({
    super.key,
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        // Basil Container
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 248, 248),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Image(
                    image: AssetImage(productImage),
                  ),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Rs $productPrice/Kg',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 154, 154, 154),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              height: 30,
                              width: 59,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 201, 199, 199)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 3),
                                      child: Text(
                                        '50 Grams',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 93, 134, 155)),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 12,
                                      color: Color.fromARGB(255, 93, 134, 155),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(
                              width: 7,
                            ),
                          ),
                          const Count(),
                          // Expanded(
                          //   flex: 10,
                          //   child: Container(
                          //     height: 30,
                          //     width: 58,
                          //     decoration: BoxDecoration(
                          //       border: Border.all(
                          //           color: const Color.fromARGB(
                          //               255, 201, 199, 199)),
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     child: const Row(
                          //       children: [
                          //         Expanded(
                          //           child: Padding(
                          //             padding: EdgeInsets.only(left: 5),
                          //             child: Icon(
                          //               Icons.remove,
                          //               size: 18,
                          //               color:
                          //                   Color.fromARGB(255, 93, 134, 155),
                          //             ),
                          //           ),
                          //         ),
                          //         Expanded(
                          //           child: Center(
                          //             child: Text(
                          //               '1',
                          //               style: TextStyle(
                          //                 fontSize: 20,
                          //                 color:
                          //                     Color.fromARGB(255, 93, 134, 155),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Expanded(
                          //           child: Padding(
                          //             padding: EdgeInsets.only(right: 5),
                          //             child: Icon(
                          //               Icons.add,
                          //               size: 18,
                          //               color:
                          //                   Color.fromARGB(255, 93, 134, 155),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
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
    );
  }
}
