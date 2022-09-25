//import 'package:abalit/src/provider/credit_card_provider.dart';
import 'package:abalit/src/provider/credit_card_provider.dart';
import 'package:abalit/src/ui/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FiveteenScreen extends StatelessWidget {

  /*  FIVETEEN SCREEN
      En esta pagina se encuentra el metodo para agregar una tarjeta de pago nueva
  */

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir tarjeta'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'fourteen'),
            );
          },
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              _CardExample(),
              
              ChangeNotifierProvider(
                create: ( _ ) => CreditCardProvider(),
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

class _CardExample extends StatelessWidget {
  const _CardExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 166, 194, 135),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('XXXX XXXX XXXX XXXX', style: TextStyle(color: Colors.white, fontSize: 22)),
              Text('MM/YY', style: TextStyle(color: Colors.white, fontSize: 22)),
              Text('Card Holder', style: TextStyle(color: Colors.white, fontSize: 22)),

            ],
          ),
        ),
      ),
    );
  }
}


class _Form extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final credit_card = Provider.of<CreditCardProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        child: Form(
          key: credit_card.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'XXXX XXXX XXXX XXXX',
                  labelText: 'Número de tarjeta',
                ),
                onChanged: ( value ) => credit_card.cardNumber = value,
                validator: (value) {
                  //TODO: VALIDAR
                }
              ),

              SizedBox( height: 30 ),

              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.datetime,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'MM/YY',
                  labelText: 'Fecha de caducidad',
                ),
                onChanged: ( value ) {},
              ),
              SizedBox( height: 30 ),

              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'XXX',
                  labelText: 'CVV',
                ),
                onChanged: ( value ) {}
                
              ),
              SizedBox( height: 30 ),

              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre Apellidos',
                  labelText: 'Titular de la tarjeta',
                ),
                onChanged: ( value ) {}
                
              ),
              
              SizedBox(height: 20),

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
          child: Text('AÑADIR',style: TextStyle( color: Colors.white ))
        ),
        onPressed: () async {
          //TODO: poner carga
          await Future.delayed(Duration(seconds: 1 ));
          
          Navigator.pushReplacementNamed(context, 'fourteen'); 
          //TODO: actualizar tarjeta
        },
      ),
    );
  }
}

