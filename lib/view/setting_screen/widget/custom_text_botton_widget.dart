import 'package:flutter/material.dart';


class CustomTextBottonWidget extends StatelessWidget {
final String title;
final IconData icon;final
 VoidCallback callback;

  const CustomTextBottonWidget(
      {required this.icon,
      required this.title,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: callback,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Icon(
          icon,
          size: 24,
          color: Colors.white,
        ),
        minLeadingWidth: 35,
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        horizontalTitleGap: 0,
        shape: const Border(
            bottom: BorderSide(
          width: 1,
          color: Colors.white24,
        )));
  }
}
