import 'package:flutter/material.dart';


class NineScreen extends StatelessWidget {

  /*  NINE SCREEN
      En esta pagina se encuentra la descripción de un producto de cocina
  */

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          //TODO: hacer card swiper
          //CardSwiper(images: images,),
          _BackImage(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Olla tapa terracota', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700)),
                    
                    SizedBox(height: 15),
                    
                    Text('49€', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500)),
                    
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

class _BackImage extends StatelessWidget {
  const _BackImage({
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
          image: NetworkImage('http://img.pccomponentes.com/articles/42/423966/1805-vidaxl-olla-con-tapa-5l-265x115cm-negra-a7d1fddf-627b-4505-9116-0b20fea6fc15.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: Colors.white ),
        onPressed: () => Navigator.pushReplacementNamed(context, 'eight'),
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
          await Future.delayed(Duration(seconds: 1 ));
          
          Navigator.pushNamed(context, 'thirteen');
        },
      ),
    );
  }
}