import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),

      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('My Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          SizedBox(width: 15,),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          SizedBox(width: 15,),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          SizedBox(width: 10,),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black12,
              child: Icon(Icons.icecream_outlined,size: 70,),
            ),
            SizedBox(height: 10,),
            Text('Ice creame is very delicious right?',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 35,),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black12,
              child: Icon(Icons.code,size: 70,),

            ),
            SizedBox(height: 10,),
            Text('Programming is not boring if you love it',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 35,),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black12,
              child: Icon(Icons.egg_outlined,size: 70,),
            ),


          ],
        ),
      ),
    );
  }
}

