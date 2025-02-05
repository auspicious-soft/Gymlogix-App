import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/constants/app_config.dart';
import 'package:gymlogix/features/data/models/login_model.dart'; 
import 'package:gymlogix/features/ds_providers/remote_repo_provider.dart';

import '../../domain/usecases/signup_usecase.dart';

/// Provider for the login use case
final signUpProvider = Provider<SignupUsecase>((ref) {
  final repository = ref.read(remoteRepositoryProvider);
  return SignupUsecase(fromRemoteRepo: repository);
});

/// StateNotifierProvider to handle login logic and state
final stateSignUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, AsyncValue<bool?>>((ref) {
  final login = ref.read(signUpProvider);
  return SignUpNotifier(login);
});

/// StateNotifierProvider to manage form validation
final stateSignUpFormNotifierProvider =
    StateNotifierProvider<SignUpFormNotifier, SignUpFormState>((ref) {
  return SignUpFormNotifier();
});

/// Model class for form validation state
class SignUpFormState {
  final bool isValid ;
   final bool isFirstNameError;
    final bool isLastNameError;
  final bool isEmailError;
  final bool isPasswordError;

  final bool  isConfirmPasswordError;

 SignUpFormState({
  this.isValid  = false,
    this.isFirstNameError = false,
    this.isLastNameError = false,
    this.isEmailError = false,
    this.isPasswordError = false,
    this.isConfirmPasswordError = false
  });
 

  SignUpFormState copyWith({bool? isValid, bool? isFirstNameError, bool? isLastNameError ,
  bool? isEmailError, bool? isPasswordError,bool? isConfirmPasswordError}) {
    // return SignUpFormState(
    //   isEmailError: isEmailError ?? this.isEmailError,
    //   isPasswordError: isPasswordError ?? this.isPasswordError,
    // );
    return SignUpFormState(isValid: isValid ?? false, isFirstNameError: isFirstNameError ?? this.isFirstNameError, 
    isLastNameError: isLastNameError ?? this.isLastNameError, 
    isEmailError: isEmailError ?? this.isEmailError, 
    isPasswordError: isPasswordError ?? this.isPasswordError,
    isConfirmPasswordError: isConfirmPasswordError ?? this.isConfirmPasswordError
    );
  }
}

/// StateNotifier to manage form validation logic
class SignUpFormNotifier extends StateNotifier<SignUpFormState> {
  SignUpFormNotifier() : super(SignUpFormState());

  void validateForm(String firstName, String lastName, String email, String password, String confirmPass) {

    final isEmailError =
        email.isEmpty || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
    final isPasswordError = password.isEmpty;
    var isCPassError = confirmPass.isEmpty;
    var status = false;
     if (firstName.isNotEmpty && lastName.isNotEmpty && !isEmailError && !isPasswordError && !isCPassError) {
      if (password == confirmPass){
 status = true;
      }else{
        print("confirm err");
        isCPassError = false;
      }
 
    }   

    state = state.copyWith(
      isValid:status ,
      isFirstNameError: firstName.isEmpty,
      isLastNameError: lastName.isEmpty,
      isEmailError: isEmailError,
      isPasswordError: isPasswordError,
      isConfirmPasswordError: isCPassError
    );
   
  
  }
  
}

/// StateNotifier to handle login actions
class SignUpNotifier extends StateNotifier<AsyncValue<bool?>> {
  final SignupUsecase _signUpUseCase;

  SignUpNotifier(this._signUpUseCase) : super(const AsyncValue.data(null));
 
  Future<void> signUp(
      {
        required String firstName,
      required String lastName,
        required String email,
      required String pass,
      required void Function(bool) onSuccess,
      required BuildContext context}) async {
    try {
      state = const AsyncValue.loading();

   const String endpoint = AppConfig.signUp;
    final String signupAt = DateTime.now().toUtc().toIso8601String();
    final String platform = Platform.isIOS ? "iOS" : "Android";

/**
 * google_id:9876543210 
gender:male
first_name:Avtar
last_name:Singh
age": 25
locale:en_US
email:avtar5@yopmail.com
password:Avtar@123
password_confirmation:Avtar@123
pic_URL:https://example.com/pic.jpg
signup_at:2024-12-24T10:00:00Z
signin_at:2024-12-24T10:05:00Z
platform: web
signup_type:email
device_id: "device123
is_premium: true
premium_expiration": null,
user_type: ""
 */
    final Map<String, dynamic> requestBody = {
      "google_id": "12131",
      "gender": "male",
      "first_name": firstName,
      "last_name": lastName,
      "age": 25,
      
      "email": email,
      "password": pass,
      "password_confirmation": pass,
      "pic_URL": "https://example.com/pic.jpg",
      "signup_at": signupAt,
      "signin_at": signupAt,
      "platform": platform,
      "signup_type": "email",
      "device_id": "1234",
      "is_premium": true,
      "premium_expiration": null,
      "user_type": "",
      "locale": "en_US",
    };


      final data = await _signUpUseCase.call(body: requestBody);

      data.fold(
        (error) {
          print("yes here error ${error.message}");
          state = AsyncValue.error(
              error.message, StackTrace.fromString("Failed to fetch user"));
        },
        (fineData) {
          state = AsyncData(fineData);
          onSuccess(fineData);
        },
      );
    } catch (e) {
      Flushbar(
        message: "Error logging in: $e",
        duration: const Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
      state =
          AsyncValue.error(e, StackTrace.fromString("Failed to execute login"));
    }
  }
}
