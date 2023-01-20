/*import 'package:dio/dio.dart';

import 'mock_interceptor.dart';

void _commonDevelopment() {
  container.registerInstance<Iterable<Interceptor>, List<Interceptor>>(
    <Interceptor>[
      if (Environment.current.useMockData) MockInterceptor(),
    ],
  );
}

void _commonProduction() {
  container.registerInstance<Iterable<Interceptor>, List<Interceptor>>(
    <Interceptor>[],
  );
}

void _common() {
  // ...

  container.registerSingleton(
    (c) => Dio(BaseOptions(
      baseUrl: Environment.current.baseUrl,
    ))
      ..interceptors.addAll(c.resolve()),
  );

  // ...
}*/
