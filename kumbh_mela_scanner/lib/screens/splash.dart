import 'package:flutter/material.dart';
import 'package:kumbh_mela_scanner/utils/app_icons.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: TweenAnimationBuilder<double>(
                curve: Easing.standardAccelerate,
                tween: Tween<double>(begin: 300.0, end: 150.0),
                duration: const Duration(milliseconds: 2000),
                builder: (BuildContext context, double value, Widget? child) {
                  return Image.asset(
                    AppIcons.logo,
                    fit: BoxFit.cover,
                    width: value,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
