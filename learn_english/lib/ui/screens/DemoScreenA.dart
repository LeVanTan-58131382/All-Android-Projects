import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'DemoScreenB.dart';
import 'DemoScreenC.dart';

class DemoScreenA extends StatefulWidget {
  const DemoScreenA({ Key? key }) : super(key: key);

  @override
  _DemoScreenAState createState() => _DemoScreenAState();
}

class _DemoScreenAState extends State<DemoScreenA> {
  int _currentIndex = 0;
  final List<Widget> _pages = [DemoScreenB(), DemoScreenC()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Demo',
      home: BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text("Navigation Example"),
          actions: <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            )
          ],
        ),
        stickyFrontLayer: true,
        frontLayer: _pages[_currentIndex],
        backLayer: BackdropNavigationBackLayer(
          items: [
            ListTile(title: Text("Widget 1")),
            ListTile(title: Text("Widget 2")),
          ],
          onTap: (int position) => {setState(() => _currentIndex = position)},
        ),
      ),
    );
  }
}