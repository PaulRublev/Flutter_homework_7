import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  var tabController;
  var index;
  CustomDrawer({super.key, required this.tabController, required this.index});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  widget.index = 0;
                  widget.tabController.index = widget.index;
                });
              },
              child: Text(
                'Home',
                style: TextStyle(
                    color: widget.index == 1 ? Colors.black : Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.index = 1;
                  widget.tabController.index = widget.index;
                });
              },
              child: Text(
                'Artist',
                style: TextStyle(
                    color: widget.index == 1 ? Colors.blue : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
