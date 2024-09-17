
class ErrorModel {
  String? message;
  int? code;
  dynamic action;

  ErrorModel({
    this.code,
    this.action,
    this.message,
  });
}
