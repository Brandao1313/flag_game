import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../data/countries.dart';
import '../models/country.dart';
import 'results_screen.dart';

class GameScreen extends StatefulWidget {
  final String? continent;
  final int duration;

  const GameScreen({
    super.key,
    required this.continent,
    required this.duration,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Random _random = Random();
  late List<Country> _pool;
  late List<Country> _remainingPool;
  late Country _current;
  late List<String> _options;

  Timer? _timer;
  int _remaining = 0;
  int _score = 0;
  int _answered = 0;
  int _correct = 0;
  bool? _lastCorrect;
  bool _locked = false;

  @override
  void initState() {
    super.initState();
    
    // TRAVA DE SEGURANÇA: Separação Absoluta
    if (widget.continent == 'Brasil (Estados)') {
      _pool = List<Country>.from(brazilStates); // Puxa SÓ os estados
    } else if (widget.continent == null) {
      _pool = List<Country>.from(worldCountries); // Puxa SÓ os países
    } else {
      _pool = worldCountries.where((c) => c.continent == widget.continent).toList(); // Filtra por continente
    }
    
    _remainingPool = List<Country>.from(_pool)..shuffle(_random);
    
    _remaining = widget.duration;
    _nextQuestion();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _remaining--);
      if (_remaining <= 0) {
        t.cancel();
        _finishGame();
      }
    });
  }

  void _nextQuestion() {
    if (_remainingPool.isEmpty) {
      _remainingPool = List<Country>.from(_pool)..shuffle(_random);
    }
    
    _current = _remainingPool.removeLast();

    final wrong = _pool.where((c) => c.name != _current.name).toList()
      ..shuffle(_random);
      
    _options = <String>[
      _current.name,
      ...wrong.take(3).map((c) => c.name),
    ]..shuffle(_random);
    
    _lastCorrect = null;
    _locked = false;
  }

  void _answer(String choice) {
    if (_locked) return;
    _locked = true;
    setState(() {
      _answered++;
      if (choice == _current.name) {
        _correct++;
        _score += 10;
        _lastCorrect = true;
      } else {
        _lastCorrect = false;
      }
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted || _remaining <= 0) return;
      setState(_nextQuestion);
    });
  }

  void _finishGame() {
    _timer?.cancel();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultsScreen(
          answered: _answered,
          correct: _correct,
          score: _score,
        ),
      ),
    );
  }

  String get _timeLabel {
    final m = (_remaining ~/ 60).toString().padLeft(2, '0');
    final s = (_remaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Color _optionColor(String option) {
    if (_lastCorrect == null) return Colors.white;
    if (option == _current.name) return Colors.green.shade200;
    return Colors.red.shade100;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isBrasilMode = widget.continent == 'Brasil (Estados)';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isBrasilMode 
              ? '🇧🇷 Brasil - Pontos: $_score'
              : 'Pontos: $_score'
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(children: [
                const Icon(Icons.timer, size: 18),
                const SizedBox(width: 6),
                Text(_timeLabel,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(child: _current.flagWidget),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Text(
              isBrasilMode
                  ? 'Qual é o estado desta bandeira?'
                  : 'Qual é o país desta bandeira?',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

            Expanded(
              flex: 4,
              child: Column(
                children: _options
                    .map((opt) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _optionColor(opt),
                                foregroundColor: Colors.black87,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed:
                                  _lastCorrect == null ? () => _answer(opt) : null,
                              child: Text(opt, style: const TextStyle(fontSize: 16)),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),

            if (_lastCorrect != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  _lastCorrect! ? '✅ Acertou!' : '❌ Errou! Era ${_current.name}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _lastCorrect! ? Colors.green : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}