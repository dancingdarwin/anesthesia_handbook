import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'acls_timers.g.dart';

@Riverpod(keepAlive: true)
class AclsTimers extends _$AclsTimers{
  /// Defines a set of timers for ACLS standard interventions, along with buttons to keep track of how many/when to give them

  /// Time since last pulse check
  final _pulseTimer = Stopwatch();

  /// Time since last Epi
  final _epiTimer = Stopwatch();

  /// Time since last Shock
  final _shockTimer = Stopwatch();

  /// Time since Code Started
  final _mainTimer = Stopwatch();

  /// Render Timer to update all text
  late Timer _renderTimer;

  /// Number of times intervention was done
  int _pulseChecks = 0;
  int _epiGiven = 0;
  int _shocksGiven = 0;

  @override
  Map<String,int> build() {
    return {
      'epiTime': _epiTimer.elapsedMilliseconds,
      'pulseTime': _pulseTimer.elapsedMilliseconds,
      'shockTime': _shockTimer.elapsedMilliseconds,
      'mainTime': _mainTimer.elapsedMilliseconds,
      'pulseChecks': _pulseChecks,
      'epiGiven': _epiGiven,
      'shocksGiven': _shocksGiven,
      'running': _mainTimer.isRunning ? 1 : 0,
    };
  }
  
  void startMain() {
    if (!_mainTimer.isRunning) {
      _mainTimer.start();
      _renderTimer = Timer.periodic(const Duration(milliseconds: 250), render);
      _pulseTimer.start();
    }

    render(_renderTimer);
  }

  void stopMain() {
    if (_mainTimer.isRunning) {
      _mainTimer.stop();

      _renderTimer.cancel();
      render(_renderTimer);
    }
  }

  void pulseCheck() {
    _pulseTimer.reset();
    _pulseTimer.start();
    _pulseChecks++;

    startMain();
  }

  void giveEpi() {
    _epiTimer.reset();
    _epiTimer.start();
    _epiGiven++;

    startMain();
  }

  void giveShock() {
    _shockTimer.reset();
    _shockTimer.start();
    _shocksGiven++;

    startMain();
  }

  void render(Timer timer) {
    state = build();
  }

}