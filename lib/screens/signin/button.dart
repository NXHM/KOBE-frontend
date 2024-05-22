import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key, //opcional
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0x002060), // Color de fondo del botón
          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding vertical
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Borde redondeado
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, // Color del texto
            fontSize: 16.0, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Peso de la fuente
          ),
        ),
      ),
    );
  }
}
