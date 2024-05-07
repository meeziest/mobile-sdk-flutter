import 'package:webitel_portal_sdk/src/domain/entities/error.dart';

abstract interface class ErrorService {
  Stream<ErrorEntity> listenToErrors();
}
