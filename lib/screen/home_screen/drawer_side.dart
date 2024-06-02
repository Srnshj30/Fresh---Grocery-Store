// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fresh_grocery_app/provider/user_provider.dart';
import 'package:fresh_grocery_app/screen/home_screen/home_screen.dart';
import 'package:fresh_grocery_app/screen/my_profile/my_profile.dart';
import 'package:fresh_grocery_app/screen/review_cart/review_cart.dart';
import 'package:fresh_grocery_app/screen/wishlist/wishlist.dart';

class DrawerSide extends StatefulWidget {
  final UserProvider userProvider;
  const DrawerSide({super.key, required this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTitle(
      {required IconData icon, required String title, Function()? onTap}) {
    return ListTile(
      onTap: onTap,
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

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 193, 210, 219),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      // backgroundImage: AssetImage('assets/logo.jpg'),
                      backgroundImage: NetworkImage(userData.userImage),
                      backgroundColor: const Color.fromARGB(255, 187, 203, 215),
                      // radius: 40,
                      maxRadius: 40,
                      /*child: Center(
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
                      ),*/
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData.userName,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        userData.userEmail,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black54),
                      ),
                      // OutlinedButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     'Login',
                      //     style: TextStyle(color: Colors.black54),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            listTitle(
              icon: Icons.home_outlined,
              title: 'Home',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            listTitle(
              icon: Icons.shopping_bag_outlined,
              title: 'Cart',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReviewCart(),
                  ),
                );
              },
            ),
            listTitle(
              icon: Icons.person_outlined,
              title: 'Profile',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(
                      userProvider: widget.userProvider,
                    ),
                  ),
                );
              },
            ),
            listTitle(
              icon: Icons.favorite_outline,
              title: 'Wishlist',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Wishlist(),
                  ),
                );
              },
            ),
            listTitle(
                icon: Icons.notifications_outlined, title: 'Notification'),
            listTitle(icon: Icons.star_outline, title: 'Ratings & Review'),
            listTitle(
                icon: Icons.file_copy_outlined, title: 'Raise a Complaint'),
            listTitle(icon: Icons.format_quote, title: 'FAQ'),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Support',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Call Us: ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '+918851625921',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mail Us: ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'saranshj35@gmail.com',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
