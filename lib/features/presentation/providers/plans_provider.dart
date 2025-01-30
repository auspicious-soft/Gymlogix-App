import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/data/models/plan_model.dart';
import 'package:gymlogix/features/domain/usecases/usecase_getplan.dart';
import 'package:gymlogix/features/presentation/providers/remote_repo_provider.dart';

/// Provider for the login use case
final getPlansProvider = Provider<UsecaseGetplan>((ref) {
  final repository = ref.read(remoteRepositoryProvider);
  return UsecaseGetplan(repository: repository);
});

/// StateNotifierProvider to handle login logic and state
final stateGetPlanProvider =
    StateNotifierProvider<GetPlanNotifier, AsyncValue<PlanModel?>>((ref) {
  final getPlan = ref.read(getPlansProvider);
  return GetPlanNotifier(getPlan);
});

class GetPlanNotifier extends StateNotifier<AsyncValue<PlanModel?>> {
  final UsecaseGetplan _planUseCase;

  GetPlanNotifier(this._planUseCase) : super(const AsyncValue.data(null));

  Future<void> getPlanData(
      {required String token, required BuildContext context}) async {
    try {
      state = const AsyncValue.loading();
      final data = await _planUseCase.call(token: token);

      data!.fold(
        (error) {
          state =
              AsyncValue.error(error, StackTrace.fromString("Failed to list"));
        },
        (fineData) {
          state = AsyncData(fineData);
        },
      );
    } catch (e) {
      Flushbar(
        message: "Error logging in: $e",
        duration: const Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
      state =
          AsyncValue.error(e, StackTrace.fromString("Failed to execute list"));
    }
  }
}
