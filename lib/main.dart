import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'listar.dart';
import 'centro_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CentroProvider()),
      ],
      child: MaterialApp(
        home: ListarCentros(),
      ),
    );
  }
}
