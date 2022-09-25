import 'package:abalit/src/provider/login_form_provider.dart';
import 'package:abalit/src/ui/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NineteenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar contraseña'),
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
          child: ChangeNotifierProvider(
            create: ( _ ) => LoginFormProvider(),
            child: _ChangePassword(),
          ),
          
          
        )
      ),
   );
  }
}

class _ChangePassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final new_password = Provider.of<LoginFormProvider>(context);


    return Container(
      child: Form(
        key: new_password.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Nueva contraseña',
              ),
              onChanged: ( value ) => new_password.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'Minimum 6 characters';                                    
                  
              },
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Repetir contraseña',
              ),
              onChanged: ( value ) => new_password.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'Minimum 6 characters';                                    
                  //TODO: validar que sea igual a la contraseña anterior
              },
            ),

            SizedBox( height: 30 ),
          ],
        )
      ),
    );
  }
}