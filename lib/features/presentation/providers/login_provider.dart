import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/data/models/login_model.dart';
import 'package:gymlogix/features/domain/usecases/usecase_login.dart';
import 'package:gymlogix/features/ds_providers/remote_repo_provider.dart';

/// Provider for the login use case
final loginProvider = Provider<UsecaseLogin>((ref) {
  final repository = ref.read(remoteRepositoryProvider);
  return UsecaseLogin(repository: repository);
});

/// StateNotifierProvider to handle login logic and state
final stateLoginNotifierProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<LoginModel?>>((ref) {
  final login = ref.read(loginProvider);
  return LoginNotifier(login);
});

/// StateNotifierProvider to manage form validation
final loginFormNotifierProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});

/// Model class for form validation state
class LoginFormState {
  final bool isEmailError;
  final bool isPasswordError;

  LoginFormState({
    this.isEmailError = false,
    this.isPasswordError = false,
  });

  LoginFormState copyWith({bool? isEmailError, bool? isPasswordError}) {
    return LoginFormState(
      isEmailError: isEmailError ?? this.isEmailError,
      isPasswordError: isPasswordError ?? this.isPasswordError,
    );
  }
}

/// StateNotifier to manage form validation logic
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  void validateForm(String email, String password) {
    final isEmailError =
        email.isEmpty || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
    final isPasswordError = password.isEmpty;

    state = state.copyWith(
      isEmailError: isEmailError,
      isPasswordError: isPasswordError,
    );
  }
}

/// StateNotifier to handle login actions
class LoginNotifier extends StateNotifier<AsyncValue<LoginModel?>> {
  final UsecaseLogin _loginUseCase;

  LoginNotifier(this._loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(
      {required String email,
      required String pass,
      required void Function(LoginModel) onSuccess,
      required BuildContext context}) async {
    try {
      state = const AsyncValue.loading();
      final data = await _loginUseCase.call(email: email, pass: pass);

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
