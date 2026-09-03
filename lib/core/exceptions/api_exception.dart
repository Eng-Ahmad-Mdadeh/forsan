import 'app_exception.dart';

class ApiException extends AppException {
  ApiException(super.message, super.lang, [super.code]);

  @override
  String toString() => message;
}

class BadRequestException extends ApiException {
  // BadRequestException(String message) : super('BadRequestException: $message');
  BadRequestException(super.message, super.lang, [super.code]);
}

class UnauthorizedException extends ApiException {
  // UnauthorizedException(String message) : super('UnauthorizedException: $message');
  UnauthorizedException(super.message, super.lang, [super.code]);
}

class ForbiddenException extends ApiException {
  // ForbiddenException(String message) : super('ForbiddenException: $message');
  ForbiddenException(super.message, super.lang, [super.code]);
}

class NotFoundException extends ApiException {
  // NotFoundException(String message) : super('NotFoundException: $message');
  NotFoundException(super.message, super.lang, [super.code]);
}

class GeneralException extends ApiException {
  GeneralException(super.message, super.lang, [super.code]);
}

class InternalServerErrorException extends ApiException {
  // InternalServerErrorException(String message) : super('InternalServerErrorException: $message');
  InternalServerErrorException(super.message, super.lang, [super.code]);
}

class DuplicatedException extends ApiException {
  // DuplicatedException(String message) : super('DuplicatedException: $message');
  DuplicatedException(super.message, super.lang, [super.code]);
}

class NoInternetConnectionException extends ApiException {
  NoInternetConnectionException({required String lang})
      : super((lang == "ar" ? "خطأ: في الأتصال في الانترنت" : "Error: No internet connection"), lang);
}
