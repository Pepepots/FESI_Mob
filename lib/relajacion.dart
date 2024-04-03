import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mascota/fondo.dart';

class Relajacion extends StatefulWidget {
  const Relajacion({super.key});

  @override
  State<Relajacion> createState() => _RelajacionState();
}

class _RelajacionState extends State<Relajacion> {
  AudioPlayer audioPlayer = AudioPlayer();
  String status = 'No iniciado';
  int _progress = 0;
  late int totalDurationInSeconds;
  //AudioCache x = AudioCache();
  //AudioPlayerState xc = AudioPlayerState()

  @override
  void initState() {
    super.initState();
    // status = '';
    totalDurationInSeconds = 0;
    audioPlayer.onPositionChanged.listen((duration) {
      setState(() {
        _progress = duration.inSeconds; // Actualiza el progreso
        print(_progress);
      });
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        print(state);
        if (state == PlayerState.playing) {
          status = 'REPRODUCIENDO';
        } else {
          if (state == PlayerState.stopped) {
            status = 'EN MODO PAUSA';
          } else if (state == PlayerState.completed) {
            status = 'REPRODUCCIÓN COMPLETA';
          }
        }
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio(String path) async {
    await audioPlayer.play(AssetSource(path));
    int durationInSeconds = await getTotalDurationInSeconds(path);
    if (durationInSeconds > 0) {
      setState(() {
        totalDurationInSeconds = durationInSeconds;
      });
    }
  }

  Future<int> getTotalDurationInSeconds(String path) async {
    Duration? duration = await audioPlayer.getDuration();
    if (duration != null) {
      return duration.inSeconds;
    } else {
      return 0;
    }
  }

  //
  // Stream<void> validacion = audioPlayer.onPlayerComplete;
  //await x.getTempDir()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.tertiarySystemBackground,
        title: const Text('Relajacion', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Fondo(), //FONDO DE PANTALLA
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Reproductor De Audio',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        playAudio('cancion15.mp3');
                      },
                      icon: const Icon(Icons.play_arrow),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        audioPlayer.pause();
                      },
                      icon: const Icon(Icons.pause),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        audioPlayer.stop();
                      },
                      icon: const Icon(Icons.stop),
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Espacio entre las filas
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pinkAccent.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            // Radio de desenfoque
                            spreadRadius: 10,
                            // Radio de expansión
                          ),
                        ],
                      ),
                      width: 250, // Ancho del contenedor
                      height: 250, // Altura del contenedor
                      child: CircularProgressIndicator(
                        value: status == 'REPRODUCIENDO'
                            ? _progress / totalDurationInSeconds
                            : 0,
                        //value: totalDurationInSeconds > 0 ? _progress / totalDurationInSeconds : 0.0,
                        backgroundColor: Colors.white, // Color del fondo
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.pinkAccent, // Color del progreso
                        ),
                        strokeWidth: 2.5, // Ancho de la barra
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'PROGRESO',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              width: 40,
                            ),
                            CircularProgressIndicator(
                              value: status == 'REPRODUCIENDO'
                                  ? _progress / totalDurationInSeconds
                                  : 0,
                              backgroundColor: Colors.white, // Color del fondo
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.pinkAccent, // Color del progreso
                              ),
                              strokeWidth: 2.5, // Ancho de la barra
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Estado: $status',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
