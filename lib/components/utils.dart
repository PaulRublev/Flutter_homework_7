import 'dart:convert';

import 'package:albums_route/components/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArtistTab extends StatefulWidget {
  const ArtistTab({super.key});

  @override
  State<ArtistTab> createState() => _ArtistTabState();
}

class _ArtistTabState extends State<ArtistTab> {
  List? artists;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await workWithJson();
    });
  }

  Future<String> fetchFileFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then((file) => file);
  }

  workWithJson() async {
    await fetchFileFromAssets('assets/artists.json').then((value) {
      setState(() {
        artists = jsonDecode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: artists == null ? 0 : artists?.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/about', arguments: {
                  'name': artists?[index]['name'],
                  'about': artists?[index]['about']
                });
              },
              child: Text(artists?[index]['name'])),
        );
      },
    );
  }
}

Route createAboutPageRoute(var args) {
  return PageRouteBuilder(
    pageBuilder: (
      context,
      animation,
      secondaryAnimation,
    ) {
      if (args.containsKey('about') && args.containsKey('name')) {
        return AboutPage(
          text: args['about'],
          title: args['name'],
        );
      }
      return const AboutPage();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
      final animate = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
          .animate(curvedAnimation);
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animate,
          child: child,
        ),
      );
    },
  );
}
