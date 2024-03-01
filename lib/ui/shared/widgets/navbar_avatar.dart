

import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Image.asset('lib/assets/images/logo_icon.png', filterQuality: FilterQuality.low,),
    );
  }
}