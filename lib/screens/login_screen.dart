import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(

              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },

              child: const Text("Login"),
            ),

            TextButton(

              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },

              child: const Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}
