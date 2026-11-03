https://youtu.be/CjLfSKGRg-o

# FLAG

Aplicativo Flutter de perguntas e respostas sobre bandeiras e estados
brasileiros. O jogador responde aos desafios, acompanha o resultado e pode
consultar o ranking local.

## Tecnologias

- Flutter
- Dart
- Material 3
- `shared_preferences` para persistência local
- `brazil_state_flags` para as bandeiras dos estados brasileiros

## Pré-requisitos

Instale e configure:

- [Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK compatível com a versão definida em `pubspec.yaml`
- Um dispositivo ou emulador Android/iOS, ou um navegador compatível

Para verificar a instalação:

```bash
flutter doctor
```

## Como rodar

1. Clone o repositório:

   ```bash
   git clone https://github.com/Brandao1313/FLAG.git
   cd FLAG
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Liste os dispositivos disponíveis:

   ```bash
   flutter devices
   ```

4. Execute o aplicativo:

   ```bash
   flutter run
   ```

   Para escolher um dispositivo específico:

   ```bash
   flutter run -d <id-do-dispositivo>
   ```

### Executar no navegador

```bash
flutter run -d chrome
```

### Executar no Android

Inicie um emulador Android ou conecte um dispositivo com a depuração USB
ativada e execute:

```bash
flutter run -d android
```

### Executar no Windows

```bash
flutter run -d windows
```

## Testes e análise

Execute os testes:

```bash
flutter test
```

Verifique problemas de análise:

```bash
flutter analyze
```

## Estrutura principal

```text
lib/
├── data/       # Dados das bandeiras e países
├── models/     # Modelos da aplicação
├── screens/    # Telas do jogo
└── main.dart   # Ponto de entrada
```
