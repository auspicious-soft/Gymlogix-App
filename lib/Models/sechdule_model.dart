import 'package:gymlogix/Models/content_model.dart';

class Schedule {
  final String createdAt;
  final String description;
  final String updatedAt;
  final String scheduleAt;
  final int userId;
  final String status;
  final String finishAt;
  final String type;
  final Content content;
  final String id;

  Schedule({
    required this.createdAt,
    required this.description,
    required this.updatedAt,
    required this.scheduleAt,
    required this.userId,
    required this.status,
    required this.finishAt,
    required this.type,
    required this.content,
    required this.id,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      createdAt: json['created_at'],
      description: json['description'],
      updatedAt: json['updated_at'],
      scheduleAt: json['schedule_at'],
      userId: json['user_id'],
      status: json['status'],
      finishAt: json['finish_at'],
      type: json['type'],
      content: Content.fromJson(json['content']),
      id: json['id'],
    );
  }
}
