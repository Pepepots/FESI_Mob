import 'package:flutter/material.dart';

class Estudio extends StatefulWidget {
  const Estudio({Key? key}) : super(key: key);

  @override
  State<Estudio> createState() => _EstudioState();
}

class _EstudioState extends State<Estudio> {
  final List<List<bool>> _isButtonPressedList = List.generate(
    15,
    (_) => List.generate(7, (_) => false),
  );

  final List<String> _imageURLs = [
    'https://cdn-icons-png.flaticon.com/256/9108/9108575.png', // Luz
    'https://cdn-icons-png.flaticon.com/512/12566/12566531.png', // Hora
    'https://cdn-icons-png.flaticon.com/256/6129/6129385.png', // Lugar
    'https://cdn-icons-png.flaticon.com/256/11833/11833300.png', // Objetos
    'https://cdn-icons-png.flaticon.com/512/6976/6976778.png', // Descanso
    'https://cdn-icons-png.flaticon.com/512/6920/6920205.png', // Energía
    'https://cdn-icons-png.flaticon.com/512/6066/6066506.png', // Dolor
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudio'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 172, 150, 90)),
            dataRowColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 32, 44, 86)),
            columns: const [
              DataColumn(label: Text('Día')),
              DataColumn(label: Text('Luz')),
              DataColumn(label: Text('Hora')),
              DataColumn(label: Text('Lugar')),
              DataColumn(label: Text('Objetos')),
              DataColumn(label: Text('Descanso')),
              DataColumn(label: Text('Energia')),
              DataColumn(label: Text('Dolor')),
            ],
            rows: List.generate(
              15,
              (index) => DataRow(cells: [
                DataCell(Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                )),
                for (int i = 0; i < 7; i++)
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isButtonPressedList[index][i] =
                              !_isButtonPressedList[index][i];
                        });
                      },
                      child: _isButtonPressedList[index][i]
                          ? Image.network(
                              _imageURLs[i],
                              width: 24,
                              height: 24,
                            )
                          : ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.red,
                                BlendMode.srcIn,
                              ),
                              child: Image.network(
                                _imageURLs[i],
                                width: 24,
                                height: 24,
                              ),
                            ),
                    ),
                  ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
