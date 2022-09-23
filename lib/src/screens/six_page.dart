//import 'package:abalit/src/widgets/widgets.dart';
import 'package:flutter/material.dart';


class SixScreen extends StatelessWidget {

  final List<Image> images = [
    Image.network('http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg'),
    Image.network('https://img2.rtve.es/imagenes/torres-cocina-tarta-frambuesas-pistachos/1551022521850.png'),
    Image.network('http://www.frostingbarcelona.com/wp-content/uploads/2015/03/verde_pistacho_dulces_frostingbarcelona_013_minitarta_pistachos.jpg'),
  ];


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          //TODO: Icon(Icons.arrow_back_ios_rounded),
          //TODO: hacer card swiper
          //CardSwiper(images: images,),
          BackImage(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Pastel de pistacho y frambuesa', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700)),
                    
                    SizedBox(height: 15),
                    
                    Text('16€', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500)),
                    
                    SizedBox(height: 15),
                    
                    Text('Descripción', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700)),
                    
                    SizedBox(height: 15),
                    
                    Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 
                      style: TextStyle(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w400), textAlign: TextAlign.justify,),
                    
                    SizedBox(height: 50),

                    _Button()

                  ],
                ),
              )
              
            ])
          )
        ],
      ),
    );

  }
}

class BackImage extends StatelessWidget {
  const BackImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: true,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black26,
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: Colors.white ),
        onPressed: () => Navigator.pushReplacementNamed(context, 'five'),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.green,
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
          child: Text('Añadir al carrito',style: TextStyle( color: Colors.white ))
        ),
        onPressed: () async {
          //TODO: poner carga
          await Future.delayed(Duration(seconds: 1 ));
          //TODO: cambiar pag
          Navigator.pushNamed(context, 'second');
        },
      ),
    );
  }
}
