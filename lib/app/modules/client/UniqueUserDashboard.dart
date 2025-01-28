import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UniqueUserDashboard extends StatelessWidget {
  static const routeName = '/uniqueUserDashboard';

  @override
  Widget build(BuildContext context) {
    // Get the current user and their details from Firestore
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle case if the user is not logged in
      return Scaffold(
        appBar: AppBar(title: Text('User Dashboard')),
        body: Center(child: Text('No user is logged in.')),
      );
    }

    // Fetch user details from Firestore
    final userRef = FirebaseFirestore.instance.collection('clients').doc(user.uid);

    return FutureBuilder<DocumentSnapshot>(
      future: userRef.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text('User Dashboard')),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: Text('User Dashboard')),
            body: Center(child: Text('Error loading data')),
          );
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Scaffold(
            appBar: AppBar(title: Text('User Dashboard')),
            body: Center(child: Text('User data not found')),
          );
        }

        var userData = snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          appBar: AppBar(title: Text('Welcome, ${userData['name']}')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Message
                Text(
                  'Welcome to your dashboard!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // User Details
                Text('Name: ${userData['name']}', style: TextStyle(fontSize: 18)),
                Text('Phone: ${userData['phoneNumber']}', style: TextStyle(fontSize: 18)),
                Text('City: ${userData['city']}', style: TextStyle(fontSize: 18)),
                Text('Requirement: ${userData['requirement']}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                // Deal Status
                Text(
                  'Deal Finalized: ${userData['dealFinalized'] ? 'Yes' : 'No'}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Help Section
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Need Help?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Email: contact@homedesignia.com',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Phone: 9811796894',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                // Logout Button
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/login');  // Ensure '/login' is a valid route in your app
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
