import 'package:flutter/material.dart';

class LeagueTablePage extends StatefulWidget {
  const LeagueTablePage({Key? key}) : super(key: key);

  @override
  State<LeagueTablePage> createState() => _LeagueTablePageState();
}

class _LeagueTablePageState extends State<LeagueTablePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('League Table Page'),
      ),
    );
  }
}

