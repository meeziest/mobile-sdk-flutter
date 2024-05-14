final class UrlHelper {
  late Uri _uri;

  UrlHelper(String url) {
    _uri = Uri.parse(url);
  }

  String getUrl() {
    return _uri.host;
  }

  int getPort() {
    if (_uri.hasPort) {
      return _uri.port;
    } else {
      switch (_uri.scheme) {
        case 'grpcs':
          return 443;
        case 'grpc':
        default:
          return 443;
      }
    }
  }

  bool isSecure() {
    return _uri.scheme == 'https' || _uri.scheme == 'grpcs';
  }
}
