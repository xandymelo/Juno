import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juno/colors.dart';
import 'package:juno/widgets/textInput.dart';

import 'widgets/bottomNavigatorBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _destino = TextEditingController();
  final TextEditingController _pontoDeEncontro = TextEditingController();
  final TextEditingController _horarioDeSaida = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          elevation: 0,
          title: const Center(
              child: Text(
            "Caronas e Companhias",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Column(
          children: [menu(), caronasPerfeitas()],
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
        bottomNavigationBar: MyBottomNavigationBar());
  }

  Widget caronasPerfeitas() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(60),
            child: Text(
              'Como seria sua carona perfeita?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: AppColors.orange),
              textAlign: TextAlign.center,
            ),
          ),
          TextInput(
            label: 'LOCAL DA UFRPE OU BAIRRO DE DESTINO',
            hint: '',
            controller: _destino,
          ),
          TextInput(
            label: 'PONTO DE ENCONTRO',
            hint: '',
            controller: _pontoDeEncontro,
          ),
          TextInput(
              label: 'HORÁRIO DE SAÍDA', hint: '', controller: _horarioDeSaida),
          const SizedBox(
            height: 48,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Mostrar caronas perfeitas',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          )
        ]),
      ),
    );
  }

  Widget menu() {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(5),
              shadowColor: MaterialStateProperty.all<Color>(AppColors.purple),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor:
                  MaterialStateProperty.all<Color>(AppColors.purple),
              // side: MaterialStateProperty.all(
              //     const BorderSide(width: 1.0, color: Color(0xFF3A0751))),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Caronas Perfeitas',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    'assets/star-juno.svg',
                    width: 20,
                    height: 20,
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
          ),
        )),
        Expanded(
            child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor:
                  MaterialStateProperty.all<Color>(AppColors.purple),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
            ),
            child: const Text(
              'Todas as caronas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )),
      ],
    );
  }
}
