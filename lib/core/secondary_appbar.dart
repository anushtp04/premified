import 'package:flutter/material.dart';
import 'package:used_car_app/presentation/main_page/widgets/bottom_nav_bar.dart';

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
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color:Theme.of(context).colorScheme.primary,
          onPressed: () {
            indexChangeNotifier.value = 0;
          },
          child: Icon(Icons.keyboard_arrow_down_sharp,
            color: Theme.of(context).colorScheme.secondary,
            size: 28),
        ),
      ),

    );
  }
  @override
  Size get preferredSize => Size.fromHeight(55);

}
