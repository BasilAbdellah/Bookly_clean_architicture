import 'package:dio/dio.dart';

abstract class Failure{
  final String message;

  Failure( this.message);

}

class ServerFailure extends Failure{
  ServerFailure( super.message);

  factory ServerFailure.fromDioError(DioException e){
     switch(e.type){

       case DioExceptionType.connectionTimeout:
         return ServerFailure("connectionTimeout");
       case DioExceptionType.sendTimeout:
         return ServerFailure("sendTimeout");
       case DioExceptionType.receiveTimeout:
         return ServerFailure("receiveTimeout");
       case DioExceptionType.badCertificate:
         return ServerFailure("badCertificate");
       case DioExceptionType.badResponse:
      return ServerFailure.BadResponse(e.response!.statusCode, e.response);
       case DioExceptionType.cancel:
         return ServerFailure("cancel");
       case DioExceptionType.connectionError:
         return ServerFailure("connectionError");
       case DioExceptionType.unknown:
         return ServerFailure("unknown Error");
     }
  }
  factory ServerFailure.BadResponse(int? statusCode,dynamic response){
    if(statusCode==404){
      return ServerFailure("Not Found");
    }else if(statusCode==500){
      return ServerFailure("Problem with server");
    }else if(statusCode==400||statusCode==401||statusCode==403){
      return ServerFailure(response['error']['message']);
    }else{
      return ServerFailure("There was an error please try again");
    }
  }
}