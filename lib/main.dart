import 'package:flutter/material.dart';
import 'package:launch_url/launchURL.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _Boton(
                precioname: () async {
                  // https://goo.gl/maps/GiqCXY8Q7ojiZxQm6
                  final Uri _urlPaser = Uri(
                    scheme: 'https',
                    host: 'play.google.com',
                    path: 'store/apps/details',
                    queryParameters: {"id": 'com.google.android.tts'},
                  );

                  if (await canLaunchUrl(_urlPaser)) {
                    launchUrl(_urlPaser);
                  }
                },
                titulo: 'HTTP:',
              ),
              const SizedBox(
                height: 30,
              ),
              _Boton(
                precioname: () async {
                  final _urlPaser = Uri.parse('sms:5550101234');

                  if (await canLaunchUrl(_urlPaser)) {
                    launchUrl(_urlPaser);
                  }
                },
                titulo: 'SMS:',
              ),
              const SizedBox(
                height: 30,
              ),
              _Boton(
                precioname: () async {
                  final _urlPaser = Uri.parse('tel:+1 555 010 999');

                  if (await canLaunchUrl(_urlPaser)) {
                    launchUrl(_urlPaser);
                  }
                },
                titulo: 'TEL:',
              ),
              const SizedBox(
                height: 30,
              ),
              _Boton(
                precioname: () async {
                  // https://goo.gl/maps/GiqCXY8Q7ojiZxQm6
                  final _urlPaser = Uri(
                    scheme: 'mailto',
                    path: 'dev-yakuza@gmail.com',
                    query: 'subject=Hello&body=Test',
                  );

                  if (await canLaunchUrl(_urlPaser)) {
                    launchUrl(_urlPaser);
                  }
                },
                titulo: 'MAIL:',
              ),
              const SizedBox(
                height: 30,
              ),
              _Boton(
                precioname: () async {
                  // https://goo.gl/maps/GiqCXY8Q7ojiZxQm6
                  final _urlPaser = Uri.parse(
                    'https://dev-yakuza.posstree.com/en/',
                  );

                  if (await canLaunchUrl(_urlPaser)) {
                    launchUrl(_urlPaser);
                  }
                },
                titulo: 'HTTP pelona:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  final String titulo;
  final Function precioname;

  const _Boton({
    required this.titulo,
    required this.precioname,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.lightBlue,
        alignment: Alignment.center,
        child: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
      onTap: () {
        precioname();
      },
    );
  }
}
