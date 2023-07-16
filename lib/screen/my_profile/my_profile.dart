import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/screen/home_screen/drawer_side.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 8,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black38,
      backgroundColor: taskbarColor,
      appBar: AppBar(
        // elevation: 5,
        title: const Text('My Profile'),
        backgroundColor: taskbarColor,
      ),
      drawer: const DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: taskbarColor,
                // child: Image.asset('assets/vegi.jpg', fit: BoxFit.cover),
              ),
              Container(
                height: 608,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 100,
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Saransh Jindal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('saranshj35@gmail.com'),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: taskbarColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.edit,
                                    color: taskbarColor,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(
                      icon: Icons.shopping_bag_outlined,
                      title: "My Orders",
                    ),
                    listTile(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                    ),
                    listTile(
                      icon: Icons.people_alt_outlined,
                      title: "Refer A Friend",
                    ),
                    listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Terms and Conditions",
                    ),
                    listTile(
                      icon: Icons.policy_outlined,
                      title: "Privacy Policy",
                    ),
                    listTile(
                      icon: Icons.addchart_outlined,
                      title: "About",
                    ),
                    listTile(
                      icon: Icons.exit_to_app_outlined,
                      title: "Log Out",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 50),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: taskbarColor,
              child: const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/fresh-supermarket-logo-with-letter-f-fast-shop-logo_221979-179.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
