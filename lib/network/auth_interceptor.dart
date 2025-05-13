import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final tmdbAccessToken = dotenv.env['TMDB_ACCESS_TOKEN']; // .env로 액세스 토큰 관리
    options.headers['Authorization'] = 'Bearer $tmdbAccessToken';

    super.onRequest(options, handler);
  }
}
