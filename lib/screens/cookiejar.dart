import 'dart:io';

import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';

var cj = new CookieJar();

class Session {
  static HttpClient client = new HttpClient()
    ..badCertificateCallback = (_certificateCheck);

  static Future<String> apiGet(String url) async {
    HttpClientRequest request = await client.getUrl(Uri.parse(url));

    _setHeadersCookies(request, url);

    HttpClientResponse response = await request.close();

    _updateCookies(response, url);

    return await response.transform(utf8.decoder).join();
  }

  static Future<String> apiPost(String url, dynamic data) async {
    HttpClientRequest request = await client.postUrl(Uri.parse(url));

    _setHeadersCookies(request, url);

    request.add(utf8.encode(json.encode(data)));

    HttpClientResponse response = await request.close();

    _updateCookies(response, url);

    return await response.transform(utf8.decoder).join();
  }

  static void _setHeadersCookies(HttpClientRequest request, String url) {
    request.headers.set('content-type', 'application/json');
    request.cookies.addAll(cj.loadForRequest(Uri.parse(url)));
  }

  static void _updateCookies(HttpClientResponse response, String url) {
    cj.saveFromResponse(Uri.parse(url), response.cookies);
  }

  static bool _certificateCheck(X509Certificate cert, String host, int port) =>
      host == 'local.domain.ext';
}
