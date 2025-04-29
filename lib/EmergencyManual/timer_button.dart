import 'package:anesthesia_handbook/util.dart';

import './acls_timers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerButton extends StatelessWidget {
  /// Generalized button for tracking time since last intervention and how many times that intervention was performed
  
  /// Text or Icon to depict intervention
  final Widget decoration;

  /// Callback when pressed
  final VoidCallback onPressed;

  /// Number of times intervention was done
  final int numTimes;

  /// Time since last intervention (in ms)
  final int time;

  /// How often intervention should be done (in mins)
  final int frequency;
    
  const TimerButton({
    required this.decoration,
    required this.onPressed,
    required this.numTimes,
    required this.time,
    required this.frequency,
    super.key
  });

  static String formatTime(int milliseconds) {
    /// Converts Stopwatch Elapsed ms to a string
    var secs = milliseconds ~/ 1000;
    var minutes = (secs ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        Row(
          children: [
            decoration,
            Text(' | $numTimes | ${formatTime(time)}')
          ]
        ),
        //Text(time)
      ],
    );

    if (time / 60000 < frequency) {
      return ElevatedButton(
        onPressed: onPressed,
        //style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary),
        child: child,
      );
    } else {
      return BlinkingButton(
        startColor: Colors.white,
        endColor: Colors.red[200]!,
        onPressed: onPressed,
        child: child,);
    }
  }
}

class CPRButton extends ConsumerWidget{
  const CPRButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timersState = ref.watch(aclsTimersProvider);
    return TimerButton(
      decoration: const Text('RHY'),
      onPressed: ref.read(aclsTimersProvider.notifier).pulseCheck,
      numTimes: timersState['pulseChecks'] ?? 0,
      time: timersState['pulseTime'] ?? 0,
      frequency: 2,
    );
  }
}

class EpiButton extends ConsumerWidget{
  const EpiButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timersState = ref.watch(aclsTimersProvider);
    return TimerButton(
      decoration: const Text('EPI'),
      onPressed: ref.read(aclsTimersProvider.notifier).giveEpi,
      numTimes: timersState['epiGiven'] ?? 0,
      time: timersState['epiTime'] ?? 0,
      frequency: 3,
    );
  }
}

class ShockButton extends ConsumerWidget{
  const ShockButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timersState = ref.watch(aclsTimersProvider);
    return TimerButton(
      decoration: const Icon(Icons.electric_bolt),
      onPressed: ref.read(aclsTimersProvider.notifier).giveShock,
      numTimes: timersState['shocksGiven'] ?? 0,
      time: timersState['shockTime'] ?? 0,
      frequency: 2,
    );
  }
}

class PEAButtons extends StatelessWidget {
  const PEAButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(flex: 1),
        CPRButton(),
        Spacer(flex: 2),
        EpiButton(),
        Spacer(flex: 1),
      ],
    );
  }
}

class VFButtons extends StatelessWidget {
  const VFButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(flex: 1),
        CPRButton(),
        Spacer(flex: 2),
        EpiButton(),
        Spacer(flex: 2),
        ShockButton(),
        Spacer(flex: 1),
      ],
    );
  }
}

class MainTimer extends ConsumerWidget {
  const MainTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timersState = ref.watch(aclsTimersProvider);
    final ThemeData theme = Theme.of(context);

    ElevatedButton startStop = ElevatedButton(
      onPressed: timersState['running'] == 1 ? ref.read(aclsTimersProvider.notifier).stopMain : ref.read(aclsTimersProvider.notifier).startMain,
      style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.error),
      child: Text(timersState['running'] == 1 ? 'Pause' : 'Start',style: TextStyle(color: theme.colorScheme.onError)),
    );

    ElevatedButton reset = ElevatedButton(
      onPressed: timersState['pulseChecks']! > 0 ? ref.read(aclsTimersProvider.notifier).resetMain : null,
      style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.error),
      child: Text('Reset',style: TextStyle(color: theme.colorScheme.onError)),
    );

    return Row(
      children: [
        const SizedBox(width: 25,),
        const Text('TOTAL TIME', style: TextStyle(fontWeight: FontWeight.bold),),
        const Spacer(),
        Text(TimerButton.formatTime(timersState['mainTime'] ?? 0), style: const TextStyle(fontWeight: FontWeight.bold),),
        const Spacer(),
        startStop,
        const Spacer(),
        reset,
        const SizedBox(width: 25,),
      ],
    );
  }
}