import 'package:flutter/material.dart';


class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.icon,
    required this.link,
    required this.subTitle,
    required this.title,
  });
}

const appMenuItems = <MenuItem> [
    MenuItem(
      icon: Icons.smart_button_outlined, 
      link: '/buttons', 
      subTitle: 'Multiple buttons in Flutter', 
      title: 'Buttons'
    ),

    MenuItem(
      icon: Icons.credit_card, 
      link: '/cards', 
      subTitle: 'Styled containers', 
      title: 'Cards'
    ),

    MenuItem(
      icon: Icons.refresh_rounded, 
      link: '/progress', 
      subTitle: 'Standard and controlled', 
      title: 'ProgressIndicators'
    ),
  ];