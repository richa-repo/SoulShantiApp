import 'package:flutter/material.dart';


class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Me Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PickMeButton(),
            SizedBox(height: 20),
            PickMeButton(),
            SizedBox(height: 20),
            PickMeButton(),
          ],
        ),
      ),
    );
  }
}

class PickMeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press logic here
        print('Button pressed!');
      },
      child: Text('Pick me'),
    );
  }
}