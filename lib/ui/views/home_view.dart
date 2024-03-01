



import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
@override
Widget build(BuildContext context) {
  return Center(
    child: ListView(
      children: [
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Home Game Page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0
                )
              ),
              SizedBox(width:20.0),
              Text(
                'Esta es una app de prueba',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0
                ),
              )
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          children: [
            buildImageContainer('lib/assets/images/stich.jpg'),
            buildImageContainer('lib/assets/images/gatito.png'),
            buildImageContainer('lib/assets/images/panda.jpg'),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const SingleChildScrollView( // Usa SingleChildScrollView para permitir desplazamiento vertical del texto si es necesario
            child: Text(
              'Lorem ipsum dolor sit amet consectetur adipiscing elit fringilla mus, sollicitudin vehicula sodales augue vivamus in volutpat eros orci class, netus dui curae et habitant convallis odio tortor. Blandit mus non fringilla neque suspendisse egestas cum taciti, maecenas morbi eros leo diam risus quisque, placerat sociosqu dapibus primis nunc penatibus volutpat. Volutpat montes in netus quisque non gravida magna curae suscipit viverra imperdiet, nam maecenas scelerisque neque eros eleifend ut habitasse cursus.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),
            )
          ),
        ),
      ],
    ),
  );
}

  Widget buildImageContainer(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(100.0),
      child: Image.asset(assetPath),
    );
  }
}