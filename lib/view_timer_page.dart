import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewTimerPage extends StatefulWidget {
  final DateTime date;
  const ViewTimerPage({Key? key, required this.date}) : super(key: key);

  @override
  State<ViewTimerPage> createState() => _ViewTimerPageState();
}

class _ViewTimerPageState extends State<ViewTimerPage> {

  late Timer _periodicTimer;

  @override
  void initState(){
    _startTimer();

    super.initState();
  }

  @override
  void dispose(){
    _periodicTimer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time remaining to ${DateFormat('dd/MM/yyyy HH:mm').format(widget.date)}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
                _calculateRemainingTime
            ),
          ],
        ),
      ),
    );
  }

  String get  _calculateRemainingTime{
    Duration remainingDuration = widget.date.difference(DateTime.now());

    if(remainingDuration.inSeconds <= 0){
      return 'Time has come';
    }

    int remainingSeconds = remainingDuration.inSeconds % 60;

    int remainingMinutes = remainingDuration.inMinutes % 60;

    int remainingHours = remainingDuration.inHours % 24;

    int remainingDays = remainingDuration.inDays;

    int remainingMonths = remainingDays ~/ 30;

    int remainingYears = remainingMonths ~/ 12;

    remainingDays = remainingDays % 30;

    remainingMonths = remainingMonths % 12;


    return '${remainingYears != 0 ? remainingYears.toString() + ' years' : ''} ${remainingMonths != 0 ? remainingMonths.toString() + ' months' : ''} ${remainingDays != 0 ? remainingDays.toString() + ' days' : ''} ${remainingHours != 0 ? remainingHours.toString() + ' hours' : ''} ${remainingMinutes != 0 ? remainingMinutes.toString() + ' minutes' : ''} ${remainingSeconds != 0 ? remainingSeconds.toString() + ' seconds' : ''}';
  }

  _startTimer() {
    _periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
      });
    });
  }
}
