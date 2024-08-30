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
    return ElevatedButton(
      onPressed: onPressed,
      //style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary),
      child: Row(
        children: [
          Row(
            children: [
              decoration,
              Text(' | $numTimes | ${formatTime(time)}')
            ]
          ),
          //Text(time)
        ],
      ),
    );
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
      time: timersState['epiText'] ?? 0,
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
    return Row(
      children: [
        const CPRButton(),
        Expanded(child: Container(),),
        const EpiButton(),
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
        CPRButton(),
        EpiButton(),
        ShockButton(),
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
      child: Text(timersState['running'] == 1 ? 'Stop' : 'Start',style: TextStyle(color: theme.colorScheme.onError)),
    );

    return Row(
      children: [
        const Text('TOTAL TIME'),
        Text(TimerButton.formatTime(timersState['mainTime'] ?? 0)),
        startStop,
      ],
    );
  }
}