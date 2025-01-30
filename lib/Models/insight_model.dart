class Insight {
  final String message;
  final int inputToken;
  final int outputToken;
  final String model;
  final int userId;
  final String type;
  final String imageUrl;
  final int like;
  final String subtitle;
  final String title;
  final List<DataPoint> dataPoints;
  final int insightId;
  final String updatedAt;
  final String createdAt;
  final String id;

  Insight({
    required this.message,
    required this.inputToken,
    required this.outputToken,
    required this.model,
    required this.userId,
    required this.type,
    required this.imageUrl,
    required this.like,
    required this.subtitle,
    required this.title,
    required this.dataPoints,
    required this.insightId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      message: json['message'],
      inputToken: json['input_token'],
      outputToken: json['output_token'],
      model: json['model'],
      userId: json['user_id'],
      type: json['type'],
      imageUrl: json['image_url'],
      like: json['like'],
      subtitle: json['subtitle'],
      title: json['title'],
      dataPoints: (json['data_points'] as List)
          .map((item) => DataPoint.fromJson(item))
          .toList(),
      insightId: json['insight_id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}

class DataPoint {
  final String key;
  final String description;
  final dynamic value;

  DataPoint({
    required this.key,
    required this.description,
    required this.value,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      key: json['key'],
      description: json['description'],
      value: json['value'],
    );
  }
}
