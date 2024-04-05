class ApiExceptiopn implements Exception{
  int code;
  String messgae;

  ApiExceptiopn({required this.code, required this.messgae});
}
