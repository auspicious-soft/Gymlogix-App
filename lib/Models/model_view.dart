import 'package:gymlogix/Models/insight_model.dart';
import 'package:gymlogix/Models/sechdule_model.dart';

class ModelView {
  final int status;
  final String reason;
  final List<Schedule> schedule;
  final String exercisesHash;
  final String plansHash;
  final String foodsHash;
  final List<Insight> insight;

  ModelView({
    required this.status,
    required this.reason,
    required this.schedule,
    required this.exercisesHash,
    required this.plansHash,
    required this.foodsHash,
    required this.insight,
  });

  factory ModelView.fromJson(Map<String, dynamic> json) {
    return ModelView(
      status: json['status'],
      reason: json['reason'],
      schedule: (json['schedule'] as List)
          .map((item) => Schedule.fromJson(item))
          .toList(),
      exercisesHash: json['exercises_hash'],
      plansHash: json['plans_hash'],
      foodsHash: json['foods_hash'],
      insight: (json['insight'] as List)
          .map((item) => Insight.fromJson(item))
          .toList(),
    );
  }
}
