import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:upd8_teste/app/pages/utils/enterprises.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: const Icon(
          Icons.account_circle,
          size: 40,
          color: Color(0xFF4879C7),
        ),
        title: const Text(
          'Olá, ',
          style: TextStyle(color: Color(0xFF4879C7)),
        ),
        actions: [
          GestureDetector(
            child: const Icon(Icons.settings, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              child: const Icon(Icons.menu, color: Colors.white),
              onTap: () {
                _key.currentState!.openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('MEU PERFIL'),
              onTap: () {
                Modular.to.pushNamed("/profile");
              },
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(
              title: Text('MEUS IMÓVEIS'),
              onTap: null,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(title: Text('FINANCEIRO'), onTap: null),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(
              title: Text('JURÍDICO'),
              onTap: null,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(
              title: Text('REPASSE'),
              onTap: null,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(
              title: Text('COMERCIAL'),
              onTap: null,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(
              title: Text('FAQ'),
              onTap: null,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: 1,
            ),
            const ListTile(
              title: Text('SOBRE'),
              onTap: null,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 3,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: Enterprises().infos.length,
                        itemBuilder: (context, index) {
                          var enterprise = Enterprises().infos[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                Text(
                                  enterprise['name']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Image.asset(
                                    enterprise['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(enterprise['description']!),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
