import 'package:gymlogix/Models/exercise_sets_model.dart';

class Exercise {
  final String finishAt;
  final String comments;
  final String type;
  final List<ExerciseList> list;

  Exercise({
    required this.finishAt,
    required this.comments,
    required this.type,
    required this.list,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      finishAt: json['finish_at'],
      comments: json['comments'],
      type: json['type'],
      list: (json['list'] as List)
          .map((item) => ExerciseList.fromJson(item))
          .toList(),
    );
  }
}

class ExerciseList {
  final int exerciseId;
  final List<Sets> sets;

  ExerciseList({
    required this.exerciseId,
    required this.sets,
  });

  factory ExerciseList.fromJson(Map<String, dynamic> json) {
    return ExerciseList(
      exerciseId: json['exercise_id'],
      sets: (json['sets'] as List).map((item) => Sets.fromJson(item)).toList(),
    );
  }
}
