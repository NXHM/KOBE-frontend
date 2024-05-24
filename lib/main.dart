import 'package:flutter/material.dart';
import 'package:myapp/screens/Home/home_page.dart';
import 'package:myapp/screens/welcome.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/Perfil/perfil.dart';
import 'package:myapp/screens/Perfil/editar_perfil.dart';
import 'package:myapp/screens/Perfil/cambio_correo.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CambioCorreo(),
  )
);