import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:upd8_teste/app/blocs/database/users_db_event.dart';
import 'package:upd8_teste/app/models/user_model.dart';

import '../blocs/database/users_db_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userDBBloc = Modular.get<UserDBBloc>();

  final nameController = TextEditingController();
  final documentController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    documentController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.5),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset('assets/images/logo.png', width: 200)),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Cadastro'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Nome completo',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      controller: documentController,
                      decoration: const InputDecoration(
                        hintText: 'CPF',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                    ),
                  ),
                  const Text(
                      'Para sua segurança use no mínimo caracteres letras e números'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: true,
                            onChanged: (val) {
                              setState(() {
                                val;
                              });
                            }),
                        const Flexible(
                          child: Text(
                              'Ao concluir seu cadastro, você concorda com nossos Termos & Política de privacidade.'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                var user = UserModel(
                                    fullname: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: '1',
                                    phone: '',
                                    document: documentController.text);

                                _userDBBloc.add(InsertUserEvent(user));
                              },
                              child: const Text('Cadastrar')),
                        ),
                        const Text('ou'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: OutlinedButton(
                              onPressed: () {
                                Modular.to.popUntil(ModalRoute.withName('/'));
                              },
                              child: const Text('Cancelar')),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Já é cadastrado?',
                      ),
                      TextSpan(
                        text: 'Entrar',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Modular.to.popUntil(ModalRoute.withName('/'));
                          },
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
