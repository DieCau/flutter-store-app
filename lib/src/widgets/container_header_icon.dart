import 'package:flutter/material.dart';

import '../design/colors.dart';

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;

  const ContainerHeaderIcon({super.key, required this.iconButton, this.configMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
        border: Border.all(color: StoreAppColors.brandLightColorBorder),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: iconButton,
    );
  }
}
