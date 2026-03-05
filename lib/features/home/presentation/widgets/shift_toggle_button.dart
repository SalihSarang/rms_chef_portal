import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/semantic_colors.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:chef_portal/features/home/presentation/bloc/shift_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/shift_event.dart';
import 'package:chef_portal/features/home/presentation/bloc/shift_state.dart';

class ShiftToggleButton extends StatelessWidget {
  final String staffId;

  const ShiftToggleButton({super.key, required this.staffId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        if (state is ShiftLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: PrimaryColors.brandGreen,
                  strokeWidth: 2,
                ),
              ),
            ),
          );
        }

        final bool isActive = state is ShiftActive;

        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              if (isActive) {
                context.read<ShiftBloc>().add(EndShiftEvent(staffId));
              } else {
                context.read<ShiftBloc>().add(StartShiftEvent(staffId));
              }
            },
            icon: Icon(
              isActive ? Icons.stop_circle : Icons.play_arrow,
              size: 18,
            ),
            label: Text(isActive ? 'End Shift' : 'Start Shift'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isActive
                  ? SemanticColors.error
                  : PrimaryColors.brandGreen,
              foregroundColor: NeutralColors.authFieldBackground,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
