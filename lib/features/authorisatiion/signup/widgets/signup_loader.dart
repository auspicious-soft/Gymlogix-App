import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart'; 
import 'package:gymlogix/app_settings/constants/app_colors.dart';
 
class SignupLoader extends StatelessWidget {
  const SignupLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Label(
              txt: "Signing Up....",
              type: TextTypes.f_20_900,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CircularProgressIndicator(
                value: 3,
                backgroundColor: Colors.grey,
                color: AppColors.primaryColor,
                // minHeight: 8,
              ),
            ),
          ],
        );
  }
}
