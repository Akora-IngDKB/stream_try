import 'package:flutter/material.dart';
import 'package:stream_try/my_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool value = false;

  @override
  void dispose() {
    MyController.myController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<bool>(
          stream: MyController.myController.stream,
          builder: (_, snapshot) {
            return Text('${snapshot.data}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value = !value;
          });

          MyController.emitValue(value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
