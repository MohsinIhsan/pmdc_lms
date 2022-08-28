import 'package:flutter/material.dart';
import 'package:pmdc_lms/utils/app_colors.dart';

class Background extends StatelessWidget {
  final Widget child;
  Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.35,
              color: AppColors.orange2.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.4,
              color: AppColors.orange2.withOpacity(0.27),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
