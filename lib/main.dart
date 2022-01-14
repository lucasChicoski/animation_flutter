import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Animations());
  }
}

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  AnimationController? controller; // controlador de animação
  Animation<double>? opacityAnimation; // tipo da animação

  @override
  void initState() {
    //Inicializar o controlador
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    //Inicialização da animação
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(controller!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(); //Add esta linha de código
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          // animação do container
          width: 300,
          height: expanded ? 300 : 400,
          curve: Curves.easeInQuad,
          color: Colors.yellow,
          duration: Duration(milliseconds: 400),
          child: Center(
            child: Column(
              children: [
                FadeTransition(
                  //Animação de opacidade
                  opacity: opacityAnimation!,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Opacidade"),
                  ),
                ),
                ElevatedButton(
                    child: Text('expandir'),
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
