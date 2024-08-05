import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/centro_educativo.dart';


//Servicio para obtener los datos y manejar la solicitud a la API

class CentroService {
  static const String apiUrl = 'https://adamix.net/minerd/minerd/centros.php';

  Future<List<CentroEducativo>> fetchCentros() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((data) => CentroEducativo.fromJson(data)).toList();
    } else {
      throw Exception('Error al cargar los centros educativos');
    }
  }
}
