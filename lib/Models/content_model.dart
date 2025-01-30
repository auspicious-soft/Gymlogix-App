import 'package:gymlogix/Models/exercise_model.dart';

class Content {
  final int planId;
  final int workoutId;
  final String comments;
  final List<Exercise> exercises;

  Content({
    required this.planId,
    required this.workoutId,
    required this.comments,
    required this.exercises,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      planId: json['plan_id'],
      workoutId: json['workout_id'],
      comments: json['comments'],
      exercises: (json['exercises'] as List)
          .map((item) => Exercise.fromJson(item))
          .toList(),
    );
  }
}
