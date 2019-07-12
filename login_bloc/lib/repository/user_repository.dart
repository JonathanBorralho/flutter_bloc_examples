import 'package:meta/meta.dart';

class UserRepository {
  Future<String> authenticate(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> deleteToken() async {
    /// delete to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }
}
