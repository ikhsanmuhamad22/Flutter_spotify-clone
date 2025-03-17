import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class OtherMethodLogin extends StatelessWidget {
  const OtherMethodLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SvgPicture.asset(AppVectors.google)),
          Expanded(child: context.isDarkMode ? SvgPicture.asset(AppVectors.apple) : SvgPicture.asset(AppVectors.appleBlack)),
        ],
      ),
    );
  }
}
