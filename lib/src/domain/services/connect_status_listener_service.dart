import 'dart:async';

import 'package:webitel_portal_sdk/src/domain/entities/connect_status.dart';

abstract interface class ConnectStatusListenerService {
  Future<StreamController<ConnectStreamStatus>> listenConnectStatus();
}
