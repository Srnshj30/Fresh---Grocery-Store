import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/screen/Profile/privacy_policy_class.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Introduction",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.introduction,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Information We Collect",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.informationWeCollect,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "1. Personal Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              PrivacyPolicy.informationWeCollect1,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2. Usage Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              PrivacyPolicy.informationWeCollect2,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "3. Cookies and Similar Technologies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              PrivacyPolicy.informationWeCollect3,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "How We Use Your Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.howWeUseInformation,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "How We Share Your Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.howWeShareInformation,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Security",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.security,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Your Choices",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.yourChoices,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Childern's Privacy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.childrensPrivacy,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Changes to This Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.changesToPolicy,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Contact Us",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              PrivacyPolicy.contactUs,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
