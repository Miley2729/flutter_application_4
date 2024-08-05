//Interfaz de Usuario
//para mostrar la lista de centros educativos con un filtro de búsqueda.



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'centro_provider.dart';
import '../../model/centro_educativo.dart';

class ListarCentros extends StatefulWidget {
  @override
  _ListarCentrosState createState() => _ListarCentrosState();
}

class _ListarCentrosState extends State<ListarCentros> {
  String query = '';

  @override
  void initState() {
    super.initState();
    Provider.of<CentroProvider>(context, listen: false).fetchCentros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centros Educativos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(
            child: Consumer<CentroProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                List<CentroEducativo> centros = provider.filterCentros(query);

                return ListView.builder(
                  itemCount: centros.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(centros[index].nombre),
                      subtitle: Text(centros[index].distrito),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
