import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cloud Firestore"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("car").snapshots(),
            builder: (context, snapshot) {
              List<Row> clientWidgets = [];

              if(snapshot.hasData){
                final clients = snapshot.data?.docs.toList();
                for(var client in clients!){
                  final clientWidget = Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(client["name"]),
                      Text(client["brand"]),
                      Text(client["color"]),
                    ],
                  );
                  clientWidgets.add(clientWidget);
                }
              }

              return ListView(
                children: clientWidgets,
              );
            },
        )
      ),
    );
  }
}
