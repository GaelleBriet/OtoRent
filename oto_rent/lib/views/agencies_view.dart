import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oto_rent/views/vehicles_view.dart';
import 'package:oto_rent/widgets/fail_widget.dart';

import '../bloc/agencies_cubit.dart';
import '../widgets/agency_liste.dart';
import '../widgets/loading_widget.dart';

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
                return AgencyList(agencies: state.agencies);
              }else if (state is AgenciesStateError) {
                return FailWidget(
                  message: state.message,
                  onRetry: () => context.read<AgenciesCubit>().fetchAgencies(),
                );
              }
              return const LoadingWidget();
            },
          )
    ),
    );
  }
}
