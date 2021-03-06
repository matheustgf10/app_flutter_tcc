import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  // Verifica se o formulário é válido, se sim faz o envio dos dados pra autenticar o usuário
  @action
  submitForm(BuildContext context) async {
    bool formValido = formKey.currentState.validate();
    if (!formValido) {
      return;
    }

    String login = user.text;
    String senha = password.text;

    print("login: $login senha: $senha");
    // teste navegação
    _navegaHomePage(context);

    // var usuario = await LoginApi.login(login, senha);
    // if (usuario != null) {
    //   _navegaHomePage(context);
    // } else {
    //   final snackbar = SnackBar(
    //     content: Text('Usuário ou senha inválido'),
    //   );
    //   Scaffold.of(context).showSnackBar(snackbar);
    // }
  }

  // Após login o usuário é direcionado para página Home
  @action
  _navegaHomePage(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  @action
  navegateResetarSenha(BuildContext context) {
    Modular.link.pushNamed('/resetar-senha');
  }

  @action
  navegaRegisterUserPage(BuildContext context) {
    Modular.link.pushNamed('/cadastro-user');
  }
}
