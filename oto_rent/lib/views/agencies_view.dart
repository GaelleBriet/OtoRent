import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oto_rent/views/home_screen.dart';

import '../bloc/agencies_cubit.dart';

class AgenciesView extends StatelessWidget {
  const AgenciesView({super.key});

  static const String pageName = 'agencies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agencies'),
      ),
      body: BlocProvider(
          create: (_) => AgenciesCubit()..fetchAgencies(),
          child: BlocBuilder<AgenciesCubit, AgenciesState>(
            builder: (_, state) {
              if (state is AgenciesStateSuccess){
                final agencies = state.agencies;
                return ListView.builder(
                  itemCount: agencies.length,
                    itemBuilder: (context, index){
                      final agency =agencies.elementAt(index);
                      return ListTile(
                        onTap: () {
                          context.pushNamed(HomeScreen.pageName, pathParameters: {
                            'agencyId': agency.id.toString(),
                          });
                        },
                        title: Text(agency.name ?? 'Nom inconnu'),
                        subtitle: Text(agency.address ?? 'Adresse inconnue'),
                      );
                    }
                );
              }else if (state is AgenciesStateError) {
                return Column(
                  children: [
                    Text(state.message),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<AgenciesCubit>().fetchAgencies(),
                      child: const Text('Réessayer'),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
    ),
    );
  }
}
