import 'package:flutter/material.dart';
import 'package:brazil_state_flags/brazil_state_flags.dart';
// Import necessário para a função flagForUf
import 'package:brazil_state_flags/lookup.dart'; 

class Country {
  final String name;
  final String code;      
  final String continent; 

  const Country({
    required this.name,
    required this.code,
    required this.continent,
  });

  String get flagUrl => 'https://flagcdn.com/w320/$code.png';

  Widget get flagWidget {
    if (continent == 'Brasil (Estados)') {
      // Usa flagForUf para converter a string 'sp' em bandeira
      final bandeira = flagForUf(code, style: FlagStyle.full);
      
      if (bandeira != null) {
        return BrazilStateFlag(bandeira, width: 200);
      } else {
        // Fallback de segurança caso a sigla não seja encontrada
        return const Icon(Icons.flag, size: 80);
      }
    } else {
      return Image.network(
        flagUrl,
        fit: BoxFit.contain,
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, __, ___) => const Icon(Icons.flag, size: 80),
      );
    }
  }
}