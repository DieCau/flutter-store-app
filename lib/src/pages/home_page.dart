import 'package:flutter/material.dart';
import 'package:store_app/src/design/colors.dart';
import 'package:store_app/src/design/radius.dart';
import 'package:store_app/src/widgets/home_app_bar_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 97.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: DieCauRadius.small, 
          bottomRight: DieCauRadius.small
        )
      ),
      backgroundColor: DieCauColors.brandLightColor,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 45.0, 16.0, 12.0),
          child: HomeAppBarTitle()
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text('Estamos aprendiendo Flutter con Diego'),
        ),
      ),
    );
  }
}