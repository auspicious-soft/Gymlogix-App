class ApiError {
  int? statusCode;
  String? description;
  dynamic response;

  ApiError({this.response, this.description, this.statusCode});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    var messages = json['messages'] != null
        ? json['messages'] is Map
            ? (json['messages'] as Map).values.toList()
            : json['messages'].cast<String>()
        : <String>[];

    var errors = json['errors'] != null
        ? json['errors'] is Map
            ? (json['errors'] as Map).values.toList()
            : json['errors'].cast<String>()
        : <String>[];

    if (messages.isEmpty) {
      if (json['message'] != null) {
        messages.add(json['message'].toString());
      }
    }

    if (errors.isEmpty) {
      if (json['error'] != null) {
        messages.add(json['error'].toString());
      }
    }

    var status = json['status'] ?? '';

    return ApiError(
      response: json,
      description:
          errors.isNotEmpty ? errors.join(' - ') : messages.join(' - '),
      statusCode: int.tryParse(status.toString()),
    );
  }
}
