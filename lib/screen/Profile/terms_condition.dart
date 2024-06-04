import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/screen/Profile/terms_condition_class.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
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
              TermsAndConditions.introduction,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Use of Service",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.useOfService,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Account Responsibility",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.accountResponsibility,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Orders and Payments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.ordersAndPayments,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Intellectual Property",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.intellectualProperty,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Termination",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.termination,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Limitation of Liability",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.limitationOfLiability,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Disclaimer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.disclaimer,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Governing Laws",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.governingLaw,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Changes to Terms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.changesToTerms,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Contact Us",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              TermsAndConditions.contactUs,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
