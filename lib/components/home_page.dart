import 'package:albums_route/components/utils.dart';
import 'package:albums_route/components/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          Center(
            child: Text('Home page'),
          ),
          ArtistTab(),
        ],
      ),
      drawer: CustomDrawer(tabController: _tabController, index: _index),
    );
  }
}
