import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_catalog/ui/database/firestore.dart';

class MyTab2 extends StatefulWidget {
  const MyTab2({Key? key}) : super(key: key);

  @override
  State<MyTab2> createState() => _MyTab2State();
}

class _MyTab2State extends State<MyTab2> with WidgetsBindingObserver {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final data = <Widget>[];

  late Timer timer;
  int count = 0;
  bool isRunning = true;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (isRunning) {
        setState(() {
          count++;
        });
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
    timer.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      isRunning = true;
      print('App resumed');
    } else if (state == AppLifecycleState.inactive) {
      isRunning = false;
      print('App inactive');
    } else if (state == AppLifecycleState.paused) {
      isRunning = false;
      print('App paused');
    } else if (state == AppLifecycleState.detached) {
      print('App detached');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                Center(
                  child: Row(
                    children: [Text("$count", style: TextStyle(fontSize: 25))],
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text('Update Data'),
                      onPressed: () {
                        //// ADD DATA HERE
                        int age = int.parse(ageController.text);
                        databaseService.createOrUpdate(
                            '1', nameController.text, age);
                        // users.add({
                        //   'name': nameController.text,
                        //   'age': int.parse(ageController.text)
                        // });
                        nameController.clear();
                        ageController.clear();
                      }),
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text('show Data'),
                      onPressed: () async {
                        //// ADD DATA HERE
                        DocumentSnapshot snapshot =
                            await databaseService.Show('1');
                        displayAlert(context, snapshot.data().toString());
                      }),
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text('Delete Data'),
                      onPressed: () async {
                        //// ADD DATA HERE
                        databaseService.Delete('1');
                      }),
                ),
                //// VIEW DATA HERE
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Row(
                      children: data,
                    ),
                  ),
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(hintText: "Name"),
                            ),
                            TextField(
                              controller: ageController,
                              decoration: InputDecoration(hintText: "Age"),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text('Add Data'),
                                onPressed: () {
                                  //// ADD DATA HERE
                                  int age = int.parse(ageController.text);
                                  databaseService.createOrUpdate(
                                      '1', nameController.text, age);
                                  // users.add({
                                  //   'name': nameController.text,
                                  //   'age': int.parse(ageController.text)
                                  // });
                                  nameController.clear();
                                  ageController.clear();
                                }),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text('Update Data'),
                                onPressed: () {
                                  //// ADD DATA HERE
                                  int age = int.parse(ageController.text);
                                  databaseService.createOrUpdate(
                                      '1', nameController.text, age);
                                  // users.add({
                                  //   'name': nameController.text,
                                  //   'age': int.parse(ageController.text)
                                  // });
                                  nameController.clear();
                                  ageController.clear();
                                }),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text('show Data'),
                                onPressed: () async {
                                  //// ADD DATA HERE
                                  DocumentSnapshot snapshot =
                                      await databaseService.Show('1');
                                  displayAlert(
                                      context, snapshot.data().toString());
                                }),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text('Delete Data'),
                                onPressed: () async {
                                  //// ADD DATA HERE
                                  databaseService.Delete('1');
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  displayAlert(BuildContext context, message) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Card(
            child: AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(child: new Text('Informasi')),
                ],
              ),
              icon: Icon(
                Icons.info,
                size: 40,
                color: Colors.amber,
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(message),
                ],
              ),
              actions: [
                TextButton(
                  child: SingleChildScrollView(child: Text("Ok")),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
