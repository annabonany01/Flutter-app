import 'package:abalit/src/provider/login_form_provider.dart';
import 'package:abalit/src/ui/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FourteenScreen extends StatelessWidget {

  /*  FOURTEEN SCREEN
      En esta pagina se encuentra la forma de pago para comprar el pedido
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'thirteen'),
            );
          },
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
             
              _Details(coste: 120, envio: 5),

              Divider(thickness: 1, height: 30),

              SizedBox(height: 30,),

              ChangeNotifierProvider(
                create: ( _ ) => LoginFormProvider(),
                child: _Form()
              ),              

              SizedBox(height: 50,),


              _Button(),

              SizedBox(height: 50,),

            ])
          )
        ],
      ),
    );
  }
}


class _Details extends StatelessWidget {

  final int coste;
  final int envio;


  const _Details({
    super.key, 
    required this.coste, 
    required this.envio
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        height: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Text('La entrega se realizará en 24 - 72 horas', style: TextStyle(color: Colors.black54),),
            _Row(coste: coste, text: 'Precio'),
            _Row(coste: envio, text: 'Gastos de envío'),
            _Row(coste:  coste + envio, text: 'Precio total'),



          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.coste, 
    required this.text,
  }) : super(key: key);

  final int coste;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(this.text, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),

        Text('$coste \€', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500))
      ],
    );
  }
}

class _Form extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Barcelona',
                  labelText: 'Dirección de entrega',
                ),
                onChanged: ( value ) => loginForm.name = value,
                
              ),

              SizedBox( height: 30 ),

              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '645823019',
                  labelText: 'Teléfono',
                  
                ),
                onChanged: ( value ) => loginForm.password = value,
                validator: ( value ) {

                    //TODO: VALIDAR
                },
              ),
              SizedBox(height: 20),


              Text('Número de tarjeta', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                    
              SizedBox(height: 10),
              
              Text('Aún no has añadido ninguna tarjeta', style: TextStyle(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w400)),
              
              SizedBox(height: 5),

              MaterialButton(
                padding: EdgeInsets.all(0),
                child: Text('AÑADIR TARJETA', style: TextStyle(color: Colors.green, fontSize: 17)),
                onPressed: () async {
                    await Future.delayed(Duration(seconds: 1 ));
                    Navigator.pushNamed(context, 'fiveteen');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.green,
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: 10, vertical: 15),
          child: Text('PAGAR',style: TextStyle( color: Colors.white ))
        ),
        onPressed: () async {
          //TODO: poner carga
          await Future.delayed(Duration(seconds: 1 ));
          
          Navigator.pushReplacementNamed(context, 'first'); 
        },
      ),
    );
  }
}

