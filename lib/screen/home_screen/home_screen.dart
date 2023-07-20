import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/provider/product_provider.dart';
import 'package:fresh_grocery_app/screen/home_screen/single_product.dart';
import 'package:fresh_grocery_app/screen/product_overview/product_overview.dart';
import 'package:fresh_grocery_app/screen/review_cart/review_cart.dart';
import 'package:provider/provider.dart';

import '../search/search.dart';
import 'drawer_side.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget listTitle(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }

  // @override
  // void initState() {
  //   ProductProvider productProvider = Provider.of(context, listen: false);
  //   productProvider.fetchVegeProductData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(
      context,
    );
    productProvider.fetchVegeProductData();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 231),
      drawer: const DrawerSide(),
      appBar: AppBar(
        // elevation: 0,
        title: const Text(
          'Home',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 17,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Search(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 24,
                  color: Color.fromARGB(255, 161, 174, 177),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 12),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.grey[300],
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ReviewCart(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  size: 22,
                  color: Color.fromARGB(255, 161, 174, 177),
                ),
              ),
            ),
          ),
        ],
        backgroundColor:
            const Color.fromARGB(255, 130, 172, 194), //Taskbar Color
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/vegi.jpg'),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 60, bottom: 0),
                          child: Container(
                            height: 55,
                            width: 105,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              color: Color.fromARGB(255, 207, 215, 221),
                            ),
                            child: const Center(
                              child: Text(
                                'Fresh',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(236, 42, 118, 108),
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Great Vibes',
                                  shadows: [
                                    BoxShadow(
                                      blurRadius: 19,
                                      color: Color.fromARGB(220, 81, 228, 132),
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // color: Colors.blue,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 50, top: 20),
                          child: Text(
                            '30% Off',
                            style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 200, 230, 201),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Text(
                            "On all Vegetable Products!!!",
                            style: TextStyle(
                              color: Color.fromARGB(255, 200, 230, 201),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 90, top: 50),
                          child: Text(
                            '*Terms and Conditions Applied',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 8,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fresh Vegetables',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Color.fromARGB(255, 121, 120, 120),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // const SizedBox(width: 0),
                  SingleProduct(
                    productImage: 'assets/potato.png',
                    productName: 'Potato',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/potato.png',
                            productName: 'Potato',
                            productAbout:
                                'The potato is a starchy food, a tuber of the plant Solanum tuberosum and is a root vegetable native to the Americas.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/tomato1.png',
                    productName: 'Tomato',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/tomato1.png',
                            productName: 'Tomato',
                            productAbout:
                                'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as the tomato plant.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/onion.png',
                    productName: 'Onion',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/onion.png',
                            productName: 'Onion',
                            productAbout:
                                'An onion, also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/ladyfinger.png',
                    productName: 'Lady Finger',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/ladyfinger.png',
                            productName: 'Lady Finger',
                            productAbout:
                                'Ladyfinger, popularly known as bhindi in India, is rich in nutrients. It is considered a good source of carbohydrates, proteins, vitamins, enzymes, calcium, potassium and many other nutrients.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/capsicum.png',
                    productName: 'Capsicum',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/capsicum.png',
                            productName: 'Capsicum',
                            productAbout:
                                'Capsicum is a genus of flowering plants in the nightshade family Solanaceae, native to the Americas, cultivated worldwide for their chili pepper or bell pepper fruit.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fresh Fruits',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Color.fromARGB(255, 121, 120, 120),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // const SizedBox(width: 0),
                  SingleProduct(
                    productImage: 'assets/watermelon.png',
                    productName: 'Watermelon',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/watermelon.png',
                            productName: 'Watermelon',
                            productAbout:
                                'Watermelon is a flowering plant species of the Cucurbitaceae family and the name of its edible fruit. A scrambling and trailing vine-like plant, it is a highly cultivated fruit worldwide, with more than 1,000 varieties.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/strawberry.png',
                    productName: 'Strawberry',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/strawberry.png',
                            productName: 'Strawberry',
                            productAbout:
                                'The garden strawberry is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/mango.png',
                    productName: 'Mango',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/mango.png',
                            productName: 'Mango',
                            productAbout:
                                'A mango is an edible stone fruit produced by the tropical tree Mangifera indica. It is believed to have originated in southern Asia, particularly in eastern India, Bangladesh, and the Andaman Islands.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/banana.png',
                    productName: 'Banana',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/banana.png',
                            productName: 'Banana',
                            productAbout:
                                'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/orange.png',
                    productName: 'Orange',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/orange.png',
                            productName: 'Orange',
                            productAbout:
                                'An orange is a fruit of various citrus species in the family Rutaceae; it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Herbs Seasonings',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Color.fromARGB(255, 121, 120, 120),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // const SizedBox(width: 0),
                  SingleProduct(
                    productImage: 'assets/fresh_basil.png',
                    productName: 'Fresh Basil',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/fresh_basil.png',
                            productName: 'Fresh Basil',
                            productAbout:
                                'Basil. It is a tender plant, and is used in cuisines worldwide. In Western cuisine, the generic term "basil" refers to the variety also known as sweet basil or Genovese basil. Basil is native to tropical regions from Central Africa to Southeast Asia.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/fresh_mint.png',
                    productName: 'Fresh Mint',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/fresh_mint.png',
                            productName: 'Fresh Mint',
                            productAbout:
                                'Spearmint, also known as garden mint, common mint, lamb mint and mackerel mint, is a species of mint, Mentha spicata, native to Europe and southern temperate Asia, extending from Ireland in the west to southern China in the east.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/oregano.png',
                    productName: 'Oregano',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/oregano.png',
                            productName: 'Oregano',
                            productAbout:
                                'Oregano is an herb composed of the fresh or dried leaves of the oregano plant. The plant has tiny leaves that lend a pungent aroma and strong flavor to a variety of savory foods.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/bay_leaf.png',
                    productName: 'Bay Leaf',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/bay_leaf.png',
                            productName: 'Bay Leaf',
                            productAbout:
                                'Bay leaf (also known as laurel) is a spice commonly used to flavor soups and meat dishes for its light, herbal flavor. It is sometimes sold in stores in a powder or as a fresh leaf, but it is most often found as a dry, whole leaf.',
                          ),
                        ),
                      );
                    },
                  ),
                  SingleProduct(
                    productImage: 'assets/fresh_dill.png',
                    productName: 'Fresh Dill',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductOverview(
                            productImage: 'assets/fresh_dill.png',
                            productName: 'Fresh Dill',
                            productAbout:
                                'Dill is an annual herb in the celery family Apiaceae. It is native to North Africa, Chad, Iran, and the Arabian Peninsula; it is grown widely in Eurasia, where its leaves and seeds are used as a herb or spice for flavouring food.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
