import 'package:flutter/material.dart';

import '../presentation/widgets/text_style.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SecondaryAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: true,
      title: AppText(
        text: title,
        size: 22,
      ),
      leading: Container(
          width: 50,
          margin: EdgeInsets.all(11),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary
          ),
          child: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Theme.of(context).colorScheme.secondary,
            size: 28,
          )),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(55);

}
