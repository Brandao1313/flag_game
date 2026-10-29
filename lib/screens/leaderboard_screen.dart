import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<String> _scores = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _scores = prefs.getStringList('top_scores') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard - Top 5')),
      body: _scores.isEmpty
          ? const Center(child: Text('Nenhuma pontuação registrada ainda.'))
          : ListView.builder(
              itemCount: _scores.length,
              itemBuilder: (_, i) => ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text('${_scores[i]} pontos'),
              ),
            ),
    );
  }
}