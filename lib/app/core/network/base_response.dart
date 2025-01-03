class BaseResponse<T> {
  bool? success;
  int? code;
  String? message;
  T? data;

  BaseResponse({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, T? data) =>
      BaseResponse(
        success: json['success'],
        code: json['code'],
        message: json['message'],
        data: data,
      );
}
