import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/local_products_page.dart'; // ← create this if not done

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user;
    try {
      user = FirebaseAuth.instance.currentUser;
    } catch (_) {
      user = null; // Firebase temporarily disabled
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome,", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Firebase fallback content
            if (user != null) ...[
              Text("Email: ${user.email}"),
              Text("User ID: ${user.uid}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                child: Text('Logout'),
              ),
            ] else ...[
              Text("Firebase user data unavailable."),
              SizedBox(height: 20),
            ],

            Divider(height: 40),
            Text("Offline Features", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LocalProductsPage()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text('View Offline Products'),
            ),
          ],
        ),
      ),
    );
  }
}
