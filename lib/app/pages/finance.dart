import 'package:flutter/material.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          'FINANCEIRO',
          style: TextStyle(color: Colors.white),
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
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).cardColor,
                    child: Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Text(
                  'SEU NOME',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'meuemail@gmail.com',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 250,
                    height: 125,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(' Parcela 14 de 20'),
                            Text(
                              'R\$ 14.180,20',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 24),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              child: const Text('PAGAR'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 5,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('NOTIFICAÇÕES'),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  title: const Text('NOVO BOLETO DISPONÍVEL'),
                  subtitle: const Text('Financeiro Lavvi'),
                  trailing: const Text('R\$2.030,80'),
                );
              }),
        ],
      ),
    );
  }
}
