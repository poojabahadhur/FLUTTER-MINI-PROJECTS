import 'package:authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // get the logged-in user

    void signUserOut() async {
      await AuthServices().signOutFromGoogle();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: signUserOut),
        ],
      ),
      body: Center(
        child: Text(
          user != null
              ? "LOGGED IN AS: ${user.email}" // show logged-in email
              : "No user logged in",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
