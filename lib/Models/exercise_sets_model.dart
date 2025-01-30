class Sets {
  final int groupId;
  final double weight;
  final int reps;
  final int distance;
  final int time;
  final String weightMeasurement;
  final String distanceMeasurement;
  final int difficulty;
  final String finishAt;
  final int duration;
  final String comment;

  Sets({
    required this.groupId,
    required this.weight,
    required this.reps,
    required this.distance,
    required this.time,
    required this.weightMeasurement,
    required this.distanceMeasurement,
    required this.difficulty,
    required this.finishAt,
    required this.duration,
    required this.comment,
  });

  factory Sets.fromJson(Map<String, dynamic> json) {
    return Sets(
      groupId: json['group_id'],
      weight: (json['weight'] as num).toDouble(),
      reps: json['reps'],
      distance: json['distance'],
      time: json['time'],
      weightMeasurement: json['weight_measurement'],
      distanceMeasurement: json['distance_measurement'],
      difficulty: json['difficulty'],
      finishAt: json['finish_at'],
      duration: json['duration'],
      comment: json['comment'],
    );
  }
}
