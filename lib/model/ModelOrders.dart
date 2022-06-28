import 'package:flutter/material.dart';

class ModelOrders extends StatelessWidget {
  const ModelOrders({Key? key, this.ImagesP, this.TextP}) : super(key: key);

  final String? ImagesP;
  final String? TextP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 240, 180, 51),
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImagesP!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(TextP!),
      ],
    );
  }
}

class ModelOrdersNetwork extends StatelessWidget {
  const ModelOrdersNetwork({Key? key, this.ImagesP, this.TextP})
      : super(key: key);

  final String? ImagesP;
  final String? TextP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(255, 240, 180, 51),
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 13),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                ImagesP!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(TextP!),
      ],
    );
  }
}

class TextOrders extends StatelessWidget {
  const TextOrders({Key? key, this.controller, this.texC}) : super(key: key);

  final String? texC;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(texC!),
        SizedBox(
          width: 50,
          child: TextFormField(
            controller: controller,
          ),
        ),
        const Text('กิโลกรัม'),
      ],
    );
  }
}
