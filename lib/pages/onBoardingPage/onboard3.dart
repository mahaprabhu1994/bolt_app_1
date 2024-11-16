import 'package:flutter/material.dart';

class OnBoard3 extends StatelessWidget {
  const OnBoard3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/onboard2.png'),
              const SizedBox(height: 10,),
              const Text('Title of OnBoard',style: TextStyle(
                color:Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w500,

              ),),
              const SizedBox(height: 10,),
              const Text(' Title of OnBoard Title of OnBoard Title of OnBoard Title of OnBoard '
                  'Title of OnBoard Title of OnBoard',style: TextStyle(
                color:Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w300,

              ),)
            ],
          )
      ),
    );
  }
}
