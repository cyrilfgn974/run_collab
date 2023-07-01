import 'package:flutter/material.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Run Collab",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(height: 10),
            const Text(
              "L'application pour trouver des sessions running près de chez soi",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {
                  print("You pressed Icon Elevated Button");
                },
                icon: const Icon(Icons.login_rounded),
                label: const Text("Se connecter")),
            ElevatedButton.icon(
                onPressed: () {
                  print("You pressed Icon Elevated Button");
                },
                icon: const Icon(Icons.how_to_reg_rounded),
                label: const Text("Créer un compte"))
          ],
        ),
      ),
    );
  }
}
