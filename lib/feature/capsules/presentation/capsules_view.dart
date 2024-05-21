import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/feature/capsules/logic/cubit/capsules_cubit.dart';
import 'package:space_x/feature/capsules/logic/cubit/capsules_state.dart';
import 'package:space_x/feature/capsules/presentation/capsule_item.dart';

class CapsulesView extends StatelessWidget {
  const CapsulesView({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<CapsulesCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Capsules')),
      body: Center(
        child: BlocBuilder<CapsulesCubit, CapsulesState>(
          bloc: read..fetchCapsules(),
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator(),
              success: (capsules) {
                if (capsules.isEmpty) return const Text('Success');

                return ListView.builder(
                  itemCount: capsules.length,
                  itemBuilder: (context, index) {
                    final capsule = capsules[index];
                    return CapsuleItem(
                        nameOfCapsule: capsule.id,
                        reuseCount: capsule.reuseCount,
                        status: capsule.status,
                        typeofCapsule: capsule.type,
                        lastUpdate: capsule.lastUpdate);
                  },
                );
              },
              error: (error) => Text('Error: $error'),
              initial: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
