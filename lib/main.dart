import 'package:flutter/material.dart';

import 'enum.dart';
import 'request_permission_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Request Permission Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  RequestPermissionManager(PermissionType.storage)
                      .onPermissionDenied(() {
                    // Handle permission denied for location
                    print('storage permission denied');
                  }).onPermissionGranted(() {
                    // Handle permission granted for location
                    print('storage permission granted');
                  }).onPermissionPermanentlyDenied(() {
                    // Handle permission permanently denied for location
                    print('storage permission permanently denied');
                  }).execute();
                },
                child: const Text("Request storage Permission")),
            ElevatedButton(
                onPressed: () {
                  RequestPermissionManager(PermissionType.readContacts)
                      .onPermissionDenied(() {
                    // Handle permission denied for location
                    print('Contacts permission denied');
                  }).onPermissionGranted(() {
                    // Handle permission granted for location
                    print('Contacts permission granted');
                  }).onPermissionPermanentlyDenied(() {
                    // Handle permission permanently denied for location
                    print('Contacts permission permanently denied');
                  }).execute();
                },
                child: const Text("Request contacts Permission")),
            ElevatedButton(
                onPressed: () {
                  RequestPermissionManager(PermissionType.whenInUseLocation)
                      .onPermissionDenied(() {
                    // Handle permission denied for location
                    print('Location permission denied');
                  }).onPermissionGranted(() {
                    // Handle permission granted for location
                    print('Location permission granted');
                  }).onPermissionPermanentlyDenied(() {
                    // Handle permission permanently denied for location
                    print('Location permission permanently denied');
                  }).execute();
                },
                child: const Text("Request location Permission")),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
