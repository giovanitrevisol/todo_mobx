import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {});
  }

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassWord(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loading = false;
    loggedIn = true;

    email = "";
    password = "";
  }

  @computed
  bool get isEmailValid => email.contains('@');
  @computed
  bool get isPasswordvalid => password.length > 6;

  @computed
  Function get loginPresset =>
      (isEmailValid && isPasswordvalid && !loading) ? login : null;

  @action
  void logout() {
    loggedIn = false;
  }
}
