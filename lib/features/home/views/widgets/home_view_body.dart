import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late Timer _timer;
  late Stopwatch _stopwatch;
  bool started = false;
  int flag = 0;
  @override
  void initState() {
    super.initState();

    _stopwatch = Stopwatch();
  }

  void _startStopwatch() {
    started = true;

    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void _stopStopwatch() {
    started = false;
    flag = 1;
    _stopwatch.stop();
    _timer.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();

    setState(() {});
  }

  String _formattedTime() {
    final elapsed = _stopwatch.elapsed;
    final hours = elapsed.inHours.remainder(60).toString().padLeft(2, '0');
    final minutes = elapsed.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = elapsed.inSeconds.remainder(60).toString().padLeft(2, '0');
    final milliseconds = (elapsed.inMilliseconds.remainder(1000) / 10)
        .floor()
        .toString()
        .padLeft(2, '0');
    return '$hours:$minutes:$seconds.$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    // _startStopwatch();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 4),
        Center(
          child: Text(
            _formattedTime(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        !started
            ? (flag == 0
                ? ElevatedButton(
                    onPressed: _startStopwatch,
                    child: const Text('Start'),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _startStopwatch,
                        child: const Text('Start'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: _resetStopwatch,
                        child: const Text('Reset'),
                      )
                    ],
                  ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _stopStopwatch,
                    child: const Text('Stop'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: _resetStopwatch,
                    child: const Text('Reset'),
                  ),
                ],
              ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
