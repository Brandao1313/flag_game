import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class ResultsScreen extends StatefulWidget {
  final int answered;
  final int correct;
  final int score;

  const ResultsScreen({
    super.key,
    required this.answered,
    required this.correct,
    required this.score,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  void initState() {
    super.initState();
    _saveBest();
  }

  Future<void> _saveBest() async {
    final prefs = await SharedPreferences.getInstance();
    final best = prefs.getInt('best_score') ?? 0;
    if (widget.score > best) {
      await prefs.setInt('best_score', widget.score);
    }
    // Top 5 (simples: guarda lista de inteiros)
    final list = prefs.getStringList('top_scores') ?? [];
    list.add(widget.score.toString());
    list.sort((a, b) => int.parse(b).compareTo(int.parse(a)));
    await prefs.setStringList('top_scores', list.take(5).toList());
  }

  @override
  Widget build(BuildContext context) {
    final pct = widget.answered == 0
        ? 0
        : (widget.correct / widget.answered * 100);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
            const SizedBox(height: 16),
            Text(
              'Pontuação: ${widget.score}',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _stat('Perguntas respondidas', '${widget.answered}'),
            _stat('Acertos', '${widget.correct}'),
            _stat('Percentual', '${pct.toStringAsFixed(1)}%'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (_) => false,
                ),
                icon: const Icon(Icons.home),
                label: const Text('Voltar ao menu'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}