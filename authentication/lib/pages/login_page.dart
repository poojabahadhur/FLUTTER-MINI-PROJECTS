import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_square_tile.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void SignUserIn() async {
    setState(() => isLoading = true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      print("Sign-in successful: ${userCredential.user?.email}");
      // StreamBuilder in AuthPage will automatically navigate
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        WrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        WrongPasswordMessage();
      } else {
        OtherErrorMessage(e.message ?? "Login error");
      }
    } catch (e) {
      OtherErrorMessage(e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  void WrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) =>
          const AlertDialog(title: Text("No user found with this email")),
    );
  }

  void WrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) =>
          const AlertDialog(title: Text("Incorrect password")),
    );
  }

  void OtherErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Icon(Icons.lock, size: 100),
                const SizedBox(height: 50),
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 73, 128, 174),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                isLoading
                    ? CircularProgressIndicator()
                    : MyButton(onTap: SignUserIn, text: "Sign In"),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                    Text("or continue with"),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySquareTile(
                      imagePath: 'lib/images/google2.jpg',
                      onTap: () => AuthServices().signInWithGoogle(),
                    ),
                    SizedBox(width: 20),
                    MySquareTile(
                      imagePath: 'lib/images/apple1.jpg',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 73, 128, 174),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
