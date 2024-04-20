// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:store_app/src/widgets/container_header_icon.dart';

import '../design/colors.dart';


class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(image: AssetImage('assets/images/user.png')),
          ),
        ),
        Expanded(
            child: Text(
          'OnlyDigital',
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        ContainerHeaderIcon(
          configMargin: const EdgeInsets.only(right: 12),
          iconButton: IconButton(
            enableFeedback: true,
            onPressed: () => print('Presionaron en Notificaciones'),
            icon: const Icon(
              Icons.notifications,
              color: StoreAppColors.brandPrimaryColor,
            ),
          ),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
            enableFeedback: true,
            onPressed: () => print('Presionaron en More Vertical'),
            icon: const Icon(
              Icons.more_vert,
              color: StoreAppColors.brandPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
