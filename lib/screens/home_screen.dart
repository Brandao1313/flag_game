import 'package:flutter/material.dart';
import '../data/countries.dart';
import 'game_screen.dart';
import 'leaderboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _duration = 60; // segundos
  String? _continent; // null = aleatório

  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GameScreen(
          continent: _continent,
          duration: _duration,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag Game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard),
            tooltip: 'Leaderboard',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LeaderboardScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // Banner
            Center(
              child: Image.network(
                'https://flagcdn.com/w320/un.png',
                height: 90,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.flag, size: 80),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Escolha o modo de jogo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Continentes
            ...continents.map((c) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.public),
                    title: Text(c),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _continent = c;
                      _startGame();
                    },
                  ),
                )),

            Card(
              color: Colors.indigo.shade50,
              child: ListTile(
                leading: const Icon(Icons.shuffle, color: Colors.indigo),
                title: const Text('Jogo Aleatório (Mundial)'),
                trailing: const Icon(Icons.play_arrow),
                onTap: () {
                  _continent = null;
                  _startGame();
                },
              ),
            ),

            const SizedBox(height: 16),
            
            // DIVISOR DE DESTAQUE
            Row(
              children: [
                const Expanded(child: Divider(thickness: 2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'DESAFIO ESPECIAL 🇧🇷',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                ),
                const Expanded(child: Divider(thickness: 2)),
              ],
            ),
            const SizedBox(height: 8),

            // CARD ESPECIAL DO BRASIL
            Card(
              elevation: 4,
              color: Colors.green.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green.shade400, width: 2),
              ),
              child: InkWell(
                onTap: () {
                  _continent = 'Brasil (Estados)';
                  _startGame();
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 40),
                      const SizedBox(height: 8),
                      Text(
                        'E o seu país? Você conhece?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Jogue com as bandeiras dos 26 estados + DF',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _continent = 'Brasil (Estados)';
                          _startGame();
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Jogar Fase Especial'),
                      )
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Tempo de jogo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Dropdown de tempo
            DropdownButtonFormField<int>(
              value: _duration,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timer),
              ),
              items: const [
                DropdownMenuItem(value: 30, child: Text('30 segundos')),
                DropdownMenuItem(value: 60, child: Text('60 segundos')),
                DropdownMenuItem(value: 180, child: Text('3 minutos')),
                DropdownMenuItem(value: 300, child: Text('5 minutos')),
              ],
              onChanged: (v) => setState(() => _duration = v!),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}