import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';

class loginScreen extends StatelessWidget{
  const loginScreen({super.key});
  const 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Inicio de Sesión'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: 
        Padding(
          padding: const EdgeInsets.all(30.0), // Padding para todos los lados
          child: Center( // Centrado
            child: SingleChildScrollView( // Para scrollear 
              child: Column( // Una sola columna para el contenido
                children: [  
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ClipOval( // Forma circular
                                child: Image.asset('assets/images/Kobey-logo.jpeg', // Imagen
                                fit: BoxFit.cover,
                                width: 200.0,
                                height: 200.0,
                                ),
                              ),
                  ),
          //SizedBox(height: 40), 
          const SizedBox(height: 20), //Textbox
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person), // cambiar por el del figma
                    labelText: 'Nombre de Usuario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
          const SizedBox(height: 20), //Textbox
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), // cambiar por el del figma
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
          const SizedBox(height: 20),  // Espacio entre el campo de texto y el botón
                ElevatedButton(
                  onPressed: () {
                    // Lógica de inicio de sesión
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),  // Bordes redondeados del botón
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0), 
                    backgroundColor: TDColors.blueLogo, // Fondo del botón
                    //foregroundColor: Colors.white, // Padding interno del botón
                  ),
                  child: const SizedBox(
                    width: double.infinity,  // Botón ocupa todo el ancho disponible
                    child: Center(
                      child: Text('Iniciar Sesión', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),  // Texto del botón
                    
                  ),
                ),
              ),
          const SizedBox(height: 10),  // Espacio entre el botón y el enlace de recuperar contraseña
                TextButton(
                  onPressed: () {
                    // rutear con la pantalla de recuperar pantalla
                  },
                  child: const Text('¿Ha olvidado su contraseña?'),  // Texto del enlace
                ),
          const SafeArea(
            child: Text("Welcome nigga")
            )
                ],) ,),)
        )
    );
  }
}