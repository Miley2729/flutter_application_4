
import 'package:flutter/material.dart';
import '../../model/centro_educativo.dart';
import '../../service/centro_service.dart';

//Proveedor para manejar lo que es el estado de los centros educativos.


class CentroProvider with ChangeNotifier {
  List<CentroEducativo> _centros = [];
  List<CentroEducativo> get centros => _centros;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final CentroService _centroService = CentroService();

  Future<void> fetchCentros() async {
    _isLoading = true;
    notifyListeners();

    _centros = await _centroService.fetchCentros();
    _isLoading = false;
    notifyListeners();
  }

  List<CentroEducativo> filterCentros(String query) {
    if (query.isEmpty) {
      return _centros;
    }
    return _centros.where((centro) => centro.nombre.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
