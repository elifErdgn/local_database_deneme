import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //reference our box
  final _myBox = Hive.box("mybox");

  void writeData() {
    _myBox.put(
      2,
      ['elif', 33, 1.4, "asdfmsfmsdfmsdfmsdf"],
    );
    print(_myBox.get(1));
  }

  void readData() {
    print(_myBox.get(2));
  }

  void deleteData() {
    _myBox.delete(2);
    print("silindi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: writeData,
              child: Text("Write"),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: readData,
              child: Text("Read"),
              color: Colors.yellow,
            ),
            MaterialButton(
              onPressed: deleteData,
              child: Text("Delete"),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
