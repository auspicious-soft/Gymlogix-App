
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/signup/pg_signup.dart';
import 'package:gymlogix/features/base/presentation/providers/login_provider.dart';
import 'package:gymlogix/features/base/presentation/screens/forgotpassword/pg_forgot_pass.dart';

 
class BtnAlreadyHaveAnAccount extends StatelessWidget {
  const BtnAlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row
    
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Label(txt: "Already have an account?", type: TextTypes.f_12_500),
    
      TextButton(onPressed: (){
                          
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PgSignup()),
              // );
                Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const  PgSignup(),
      ),
      (Route<dynamic> route) => false,
    );
            
            
      }, child: const Label(txt: "SignUp", type: TextTypes.f_20_700,forceColor: Colors.red,))
    ],);
  }
}
