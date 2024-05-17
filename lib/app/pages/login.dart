import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../blocs/database/users_db_bloc.dart';
import '../blocs/database/users_db_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userDBBloc = Modular.get<UserDBBloc>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
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
                      image: AssetImage('assets/images/image2.png'),
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
                child: Image.asset('assets/images/logo.png', width: 200),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bem Vindo'),
                  const SizedBox(height: 50),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe seu e-mail';
                            } else if (value.length < 5 &&
                                !value.contains('@')) {
                              return 'Por favor, informe um e-mail válido.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Senha',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe sua senha';
                            }
                            return null;
                          },
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _userDBBloc.add(LoginUserEvent(
                                usernameController.text,
                                passwordController.text));
                          }
                        },
                        child: const Text('ENTRAR')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Esqueceu a senha?',
                        recognizer: TapGestureRecognizer()..onTap = null,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Primeiro acesso?',
                      ),
                      TextSpan(
                        text: 'clique aqui',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Modular.to.pushNamed("/register");
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
