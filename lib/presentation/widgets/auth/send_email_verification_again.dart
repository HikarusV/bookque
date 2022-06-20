import 'dart:async';

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class SendEmailVerificationAgain extends StatefulWidget {
  const SendEmailVerificationAgain({Key? key, required this.whenPressed})
      : super(key: key);
  final VoidCallback whenPressed;

  @override
  State<SendEmailVerificationAgain> createState() =>
      _SendEmailVerificationAgainState();
}

class _SendEmailVerificationAgainState
    extends State<SendEmailVerificationAgain> {
  late Timer _timer;
  int _start = 120;
  bool isWaiting = true;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 120;
            isWaiting = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _start = 120;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (isWaiting)
          ? Text('Resent email after : $_start')
          : TextButton(
              onPressed: () async {
                widget.whenPressed();
                await Future.delayed(const Duration(seconds: 2));
                _start = 120;
                startTimer();
                setState(() {
                  isWaiting = true;
                });
              },
              child: Text(
                'Resent Email',
                style: subText,
              ),
            ),
    );
  }
}
