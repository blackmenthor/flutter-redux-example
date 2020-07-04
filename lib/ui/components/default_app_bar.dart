import 'package:flutter/material.dart';
import 'package:flutter_redux_complete/ui/utils/constants.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  final bool withBackBtn;
  final VoidCallback onBackPressed;

  DefaultAppBar({
     this.withBackBtn = false,
     this.onBackPressed
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Constants.APP_NAME),
      leading: !withBackBtn
          ? null
          : GestureDetector(
            onTap: () => onBackPressed(),
            child: Icon(
            Icons.arrow_back
      ),
          ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(56);
}
