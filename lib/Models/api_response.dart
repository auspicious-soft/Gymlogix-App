import 'api_error.dart';

class ApiResponse<T> {
  T? data;
  ApiError? error;
  bool? status;
  int? statusCode;
  String? message;
  int? pageIndex;
  int? pageSize;
  int? totalPages;
  int? totalCount;

  ApiResponse({
    this.data,
    this.error,
    this.status,
    this.statusCode,
    this.message,
    this.pageIndex,
    this.pageSize,
    this.totalCount,
    this.totalPages,
  });
}
