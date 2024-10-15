import 'package:injectable/injectable.dart';

class AppEnv {
  static const beta = 'beta';
}

const beta = Environment(AppEnv.beta);
