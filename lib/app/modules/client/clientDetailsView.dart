import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './uniqueUserDashboard.dart'; // Import your UniqueUserDashboard screen

class ClientDetailsView extends StatefulWidget {
  static const routeName = '/clientDetailsView';

  @override
  _ClientDetailsViewState createState() => _ClientDetailsViewState();
}

class _ClientDetailsViewState extends State<ClientDetailsView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController requirementController = TextEditingController();

  bool isSubmitting = false;
  bool isSubmitted = false;

  Future<void> _submitDetails(BuildContext context) async {
    final name = nameController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final city = cityController.text.trim();
    final address = addressController.text.trim();
    final requirement = requirementController.text.trim();

    if (name.isEmpty ||
        phoneNumber.isEmpty ||
        city.isEmpty ||
        address.isEmpty ||
        requirement.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userRef = FirebaseFirestore.instance.collection('clients').doc(user.uid);

        // Save details to Firestore with 'dealFinalized: false'
        await userRef.set({
          'name': name,
          'phoneNumber': phoneNumber,
          'role': 'client',
          'city': city,
          'address': address,
          'requirement': requirement,
          'email': user.email,
          'submittedAt': Timestamp.now(),
          'dealFinalized': false, // Automatically set as false
        });

        setState(() {
          isSubmitted = true; // Mark as submitted
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Details submitted successfully!')),
        );

        // Navigate to UniqueUserDashboard after successful submission
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UniqueUserDashboard()), // Navigate to UniqueUserDashboard
          );
        });
      }
    } catch (e) {
      print("Error saving client details: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting details')),
      );
    } finally {
      setState(() {
        isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Client Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isSubmitted
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 20),
              Text(
                'Thank you for submitting your details!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Our executive will contact you soon.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
            : Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: requirementController,
              decoration: InputDecoration(labelText: 'Requirement'),
            ),
            SizedBox(height: 20),
            isSubmitting
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () => _submitDetails(context),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
