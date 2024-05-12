import 'package:dio/dio.dart';

class ApiExceptiopn implements Exception {
  int code;
  String messgae;
  Response<dynamic>? response;
  ApiExceptiopn({required this.code, required this.messgae, this.response}) {
    if (code != 400) {
      return;
    }
    if (messgae == "Failed to authenticate.") {
      messgae = "نام کاربری یا رمز عبور اشتباه است";
    }

    if (messgae == "Something went wrong while processing your request.") {
      messgae = "مقادیر ورودی نمیتواند خالی باشد!";
    }
     
     if (messgae == "Failed to create record."){

      if (response?.data["data"]["username"] != null){

        if (response?.data["data"]["username"]["message"] == "The username is invalid or already in use."){

          messgae = "نام کاربری تکراری است";
        }
      }
     }

     

          
     if (messgae == "Failed to create record."){

      if (response?.data["data"]["passwordConfirm"] != null){

        if (response?.data["data"]["passwordConfirm"]["message"] == "Values don't match."){

          messgae = "پسوردها شباهت ندارد";
        }
      }
     }
  }
}
