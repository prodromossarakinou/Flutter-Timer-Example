import 'package:custom_timer/view_timer_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Timer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Select Date'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat('dd/MM/yyyy HH:mm').format(_selectedDate),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: _selectedDate.add(
                    const Duration(days: 5000),
                  ),
                ).then((value) {
                  setState(() {
                    _selectedDate = value!;
                  });
                });
              },
              child: const Text('Choose date'),
            ),
            OutlinedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                   initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                ).then((value) {
                  setState(() {
                    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, value?.hour ?? 0, value?.minute ?? 0);
                  });
                });
              },
              child: const Text('Choose Time'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewTimerPage(date: _selectedDate)));
              },
              child: const Text('View Timer'),
            ),
          ],
        ),
      ),

    );
  }
}
