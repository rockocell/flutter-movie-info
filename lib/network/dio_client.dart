import 'package:dio/dio.dart';
import 'package:movie_info_app/network/auth_interceptor.dart';

class DioClient {
  // Dio 싱글톤 구현
  // 클래스 내에 자기 자신을 저장
  // DioClient._internal()을 통해 만든 인스턴스를 하나만 저장
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  // 캐싱된 인스턴스(기존 인스턴스)를 반환하는 factory 생성자
  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(BaseOptions(contentType: 'application/json;charset=utf-8'));
    // 인터셉터 추가
    dio.interceptors.add(AuthInterceptor());
  }
}

// 즉, _internal로 내부에서만 접근할 수 있는 메서드로
// 생성은 내부에서 한 번만
// 외부에서는 factory 생성자로 인스턴스를 사용할 수 있음
