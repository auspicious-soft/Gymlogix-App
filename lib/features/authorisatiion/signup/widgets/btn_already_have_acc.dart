 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';

class BtnAlreadyHaveAcc extends StatelessWidget {
  const BtnAlreadyHaveAcc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Label(txt: "Already have an account?", type: TextTypes.f_12_500),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PgLogin()),
              );
            },
            child: const Label(
              txt: "Login",
              type: TextTypes.f_20_700,
              forceColor: Colors.red,
            ))
      ],
    );
  }
}
