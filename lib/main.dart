import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:app_for_communication/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server"),
      ),
      body: GetBuilder<ServerController>(
        init: ServerController(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Text("Server",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                            decoration: BoxDecoration(
                              color: controller.server!.running
                                  ? Colors.green[400]
                                  : Colors.red[400],
                            ),
                            padding: const EdgeInsets.all(5),
                            child:
                                Text(controller.server!.running ? "ON" : "OFF"))
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
