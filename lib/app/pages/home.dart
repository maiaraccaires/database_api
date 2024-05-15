import 'package:flutter/material.dart';
import 'package:upd8_teste/app/pages/finance.dart';

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
          'Olá, Maiara',
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
            const ListTile(
              title: Text('MEU PERFIL'),
              onTap: null,
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
            ListTile(
              title: const Text('FINANCEIRO'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const FinancePage(),
                  ),
                );
              },
            ),
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
      body: Column(
        children: [
          Container(
            height: 3,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
