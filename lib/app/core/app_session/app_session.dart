import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_session.g.dart';

class AppSession {
  String? type;
  bool? isShopResgiter;
  String? token;
  String? refreshToken;
}

@riverpod
AppSession appSession(AppSessionRef ref) {
  return AppSession();
}
