import 'package:dio/dio.dart';

class ApiException implements Exception {
  int? code;
  String? message;
  Response<dynamic>? response;
  ApiException(this.code, this.message, {this.response}) {
    if (code != 400) {
      return;
    }
    if (message == 'Failed to authenticate.') {
      message = 'نام کاربری یا رمز عبور اشتباه است';
    }
    if (message == 'Failed to create record.') {
      message = 'خطایی در ساختن اکانت شما به وجود آمد\n رمز عبور باید حداقل 8 کاراکتر باشد و  \nبا تکرار رمز عبور مطابقت داشته باشد';
    }
    if (message == 'Failed to create record.') {
      if (response?.data['data']['username']['message'] != {
        if(response?.data['data']['username']['message'] == 'The username is invalid or already in use.')
        {
          message = 'نام کاربری نا معتبر است یا قبلا استفاده شده است'
        }
      }) ;
    }
  }
}
