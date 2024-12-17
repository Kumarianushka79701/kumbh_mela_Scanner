import 'package:flutter/material.dart';
import 'package:kumbh_mela_scanner/screens/home/views/home_view.dart';
import 'package:kumbh_mela_scanner/screens/login/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    void handleLogin() async {
      if (loginProvider.email.trim().isEmpty || loginProvider.password.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email and Password cannot be empty'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Proceed with login
      await loginProvider.login();

      if (!loginProvider.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful!')),
        );

        // Navigate to Home Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: loginProvider.setEmail,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: loginProvider.setPassword,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: loginProvider.isLoading ? null : handleLogin,
              child: loginProvider.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
