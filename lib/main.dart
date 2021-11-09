import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<SwitchData>(
        create: (context) => SwitchData(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(context.watch<SwitchData>().getData.toString()),
          ),
          body: Center(
            child: Switch(
              value: context.watch<SwitchData>().getData,

              onChanged: (value) =>
                  context.read<SwitchData>().changeSwitch(value),
              //activeTrackColor: Colors.yellow,
              //activeColor: Colors.orangeAccent,
            ),
          )),
    );
  }
}

class SwitchData with ChangeNotifier {
  bool _data = false;

  bool get getData => _data;

  void changeSwitch(bool newBool) {
    _data = newBool;

    notifyListeners();
  }
}
