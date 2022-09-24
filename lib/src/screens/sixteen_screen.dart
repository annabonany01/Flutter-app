import 'package:flutter/material.dart';


class SixteenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                    backgroundImage: NetworkImage('https://www.viewbug.com/media/mediafiles/2016/05/07/65898563_large.jpg'),
                  ),
                  SizedBox(height: 20,),
                  Text('Marta Gómez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
              
            )
          ]
        ),
      ),
    );
  }
}