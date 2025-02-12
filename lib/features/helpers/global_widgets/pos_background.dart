
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';

class PositionBackGround extends StatelessWidget {
  const PositionBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        AppAssets.backgroudimg,
        fit: BoxFit.cover,
      ),
    );
  }
}
