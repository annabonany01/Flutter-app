import 'package:abalit/src/provider/login_form_provider.dart';
import 'package:abalit/src/ui/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EighteenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.green, ),
            onPressed: () => Navigator.pushReplacementNamed(context, 'seventeen')
          ),
          
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'seventeen'),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.start,
            children:[ 
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 70,
                      backgroundColor: Color.fromARGB(121, 76, 175, 79),
                      backgroundImage: NetworkImage('https://www.viewbug.com/media/mediafiles/2016/05/07/65898563_large.jpg'),
                    ),
                    SizedBox(height: 20,),
                    Text('Cambiar imagen de perfil', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.lightGreen)),
                  ],
                ),
                
              ),
              ChangeNotifierProvider(
                create: ( _ ) => LoginFormProvider(),
                child: _NewProfile(),
              ),
              
            ],
            
          ),
        ),
      ),
   );
  }
}

class _NewProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final new_profile = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: new_profile.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            SizedBox( height: 30 ),

            
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Marta Gomez',
                labelText: 'Nombre y Apellidos',
              ),
              onChanged: ( value ) => new_profile.name = value,
              
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'correo@ejemplo.kom',
                labelText: 'Correo',
              ),
              onChanged: ( value ) => new_profile.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Wrong input';

              },
            ),
            SizedBox( height: 30 ),


            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: '645823019',
                labelText: 'Teléfono',
              ),
              onChanged: ( value ) => new_profile.movil = value,
              validator: ( value ) {

                return ( value != null && value.length == 9 ) 
                  ? null
                  : 'Wrong input';                                    
                  
              },
            ),

          ],
        ),
      ),
    );
  }
}