import 'package:logger/logger.dart';
import 'dart:developer' as dev;

class LogUtils{
  static Logger logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printTime: true,
      // printEmojis: false,
      // noBoxingByDefault: true,
    )
  );

  static void d(dynamic message, {required String name,Object? error,StackTrace? st,}) {
    // logger.d(message,error: error,stackTrace: st,);
    dev.log(message.toString(),name: name,stackTrace: st,error: error,level:0);
  }

  static void i(dynamic message, {required String name,Object? error,StackTrace? st,}) {
    // logger.i(message,error: error,stackTrace: st,);
    dev.log(message.toString(),name: name,stackTrace: st,error: error,level:800);
  }

  static void w(dynamic message, {Object? error,StackTrace? st,}) {
    logger.w(message,error: error,stackTrace: st,);
  }

  static void e(dynamic message, {Object? error,StackTrace? st,}) {
    logger.e(message,error: error,stackTrace: st,);
  }

  static void t(dynamic message, {Object? error,StackTrace? st,}) {
    logger.t(message,error: error,stackTrace: st,);
  }

  static void f(dynamic message, {Object? error,StackTrace? st,}) {
    logger.f(message,error: error,stackTrace: st,);
  }
  static void log(Level level,dynamic message, {Object? error,StackTrace? st,}) {
    logger.log(level,message,error: error,stackTrace: st,);
  }
}