import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/agencies_cubit.dart';

class FailWidget extends StatelessWidget {
  const FailWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        const SizedBox(height: 20),

        if (onRetry != null) ... [
          ElevatedButton(
            onPressed: () => onRetry,
            child: const Text('Réessayer'),
          )
        ],

      ],
    );
  }
}
