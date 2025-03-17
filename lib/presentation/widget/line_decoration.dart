import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class LineDecoration extends StatelessWidget {
  const LineDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SvgPicture.asset(AppVectors.lineLeft)),
          SizedBox(width: 5),
          Text('Or'),
          SizedBox(width: 5),
          Expanded(child: SvgPicture.asset(AppVectors.lineRight)),
        ],
      ),
    );
  }
}
