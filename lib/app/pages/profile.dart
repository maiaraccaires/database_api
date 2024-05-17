import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:upd8_teste/app/blocs/users/users_bloc.dart';
import 'package:upd8_teste/app/blocs/users/users_event.dart';
import 'package:upd8_teste/app/blocs/users/users_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _userBloc = Modular.get<UsersBloc>();

  @override
  void initState() {
    super.initState();
    _userBloc.add(FetchUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          'MEU PERFIL',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
      body: BlocBuilder<UsersBloc, UsersState>(
          bloc: _userBloc,
          builder: (context, state) {
            if (state is UsersError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is LoadingUsers) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.secondary),
                ),
              );
            } else if (state is UsersLoaded && state.data.isNotEmpty) {
              return Column(
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
                          state.data[0].fullname,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          state.data[0].email,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.white, fontSize: 14),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(state.data[0].phone!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.language_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          state.data[0].website!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_city_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          state.data[0].company!.name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                      ],
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
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text('ENDEREÇO'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(
                        Icons.location_city_outlined,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                        'Street ${state.data[0].address!.street!}, ${state.data[0].address!.suite}'),
                    subtitle: Text(
                        'City ${state.data[0].address!.city} - ${state.data[0].address!.zipcode}'),
                  )
                ],
              );
            }
            return Container();
          }),
    );
  }
}
