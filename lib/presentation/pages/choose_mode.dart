import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/configs/assets/app_image.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/widget/big_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.bgImage2),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              // child: SvgPicture.asset(
                              //   AppVectors.moon,
                              //   fit: BoxFit.none,
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Dark Mode',
                          style: TextStyle(color: AppColors.gray),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              // child: SvgPicture.asset(
                              //   AppVectors.sun,
                              //   fit: BoxFit.none,
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Light Mode',
                          style: TextStyle(color: AppColors.gray),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28),
                BigButton(onPressed: () {}, text: 'Get Started', height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
