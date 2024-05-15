import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upd8_teste/app/pages/forgot_password.dart';
import 'package:upd8_teste/app/pages/home.dart';
import 'package:upd8_teste/app/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                child: SvgPicture.asset('assets/svg/logo-lavvi.svg',
                    width: 200, semanticsLabel: 'Logo Lavvi'),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Nome de usuário ou e-mail',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage(),
                          ));
                        },
                        child: const Text('ENTRAR')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Esqueceu a senha?',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ForgotPasswordPage(),
                              )),
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegisterPage(),
                            ));
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
