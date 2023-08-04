class AppResponse<T> {
  bool? success;
  List<T>? data;
  String? message;

  AppResponse({this.success, this.data, this.message});
}
