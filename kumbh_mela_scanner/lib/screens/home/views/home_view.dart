import 'package:flutter/material.dart';
import 'package:kumbh_mela_scanner/utils/colors.dart';
import 'package:kumbh_mela_scanner/widgets/common_app_bar.dart';
import 'package:kumbh_mela_scanner/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:   getAppBar(context,
          title: getHomeAppBarTitle(context),
          
          
    ));}
      
  
}Widget getHomeAppBarTitle(BuildContext context) {
  return const TextWidget(
    label: "DashBoard",
    textColor: CustomColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}