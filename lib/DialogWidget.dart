import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: Color.fromARGB(255, 80, 131, 250),
      child: Dialog(
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/iztacala.png'
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Has completado la tarea'
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 32,
                      ),
                      foregroundColor: Color(0xFF03037A),
                      side: const BorderSide(
                        color:Color(0xFF03037A),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('ACEPTAR'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}