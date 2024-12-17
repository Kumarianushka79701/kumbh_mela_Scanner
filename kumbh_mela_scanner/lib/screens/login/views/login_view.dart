import 'package:flutter/material.dart';
import 'package:kumbh_mela_scanner/screens/home/views/home_view.dart';
import 'package:kumbh_mela_scanner/screens/login/provider/login_provider.dart';
import 'package:kumbh_mela_scanner/utils/app_icons.dart';
import 'package:kumbh_mela_scanner/utils/colors.dart';
import 'package:kumbh_mela_scanner/widgets/button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    void handleLogin() async {
      if (loginProvider.email.trim().isEmpty ||
          loginProvider.password.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email and Password cannot be empty'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      await loginProvider.login();

      if (!loginProvider.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  AppIcons.kumbhLogo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                  AppIcons.logo,
                  
                ),
                SizedBox(height: 10,),
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
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.7,
                    label: "Login",
                    onTap: loginProvider.isLoading ? null : handleLogin,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
