import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BakoSettingMenuTile extends StatelessWidget {
  const BakoSettingMenuTile({
    super.key, 
    required this.icon, 
    required this.title,
    required this.subTitle, 
    this.trailing, 
    this.onTap,
    });

  final IconData icon;
  final String title; 
  final String subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: BakoColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}