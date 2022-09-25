import 'package:flutter/material.dart';


class SeventeenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'sixteen'),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Container(
          width: double.infinity,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RowSettings('Editar perfil', () => Navigator.pushReplacementNamed(context, 'eighteen')),
              SizedBox(height: 10),
              _RowSettings('Cambiar contraseña', () => Navigator.pushReplacementNamed(context, 'nineteen')),
              SizedBox(height: 10),

              _RowSettings('Términos y condiciones', () {}),
              SizedBox(height: 10),

              _RowSettings('Política de privacidad', () {}),
              SizedBox(height: 10),

              _RowSettings('Información', () => Navigator.pushReplacementNamed(context, 'twenty')),
              SizedBox(height: 10),

              Text('Cerrar sesión', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)

            ],
          ),
        ),
      ),
   );
  }

  Row _RowSettings(String text, Function()? page) {
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(color: Colors.black45, fontSize: 18),),
        IconButton(
          onPressed: page, 
          icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.lightGreen,),
        )
        
      ],
    );
  }
}