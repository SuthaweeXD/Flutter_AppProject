import 'package:flutter/material.dart';

class TextFormFieldModel extends StatelessWidget {
  const TextFormFieldModel(
      {Key? key,
      @required this.labelText,
      this.hintText,
      @required this.controller,
      this.textError,
      this.helperText,
      this.keytype,
      this.maxlength})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? textError;
  final String? helperText;
  final TextEditingController? controller;
  final bool? keytype;
  final int? maxlength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keytype != true ? null : TextInputType.number,
      controller: controller,
      maxLength: maxlength,
      validator: (value) {
        if (value!.isEmpty) {
          return textError;
        } else {
          return null;
        }
      },
      style: TextStyle(
        color: Color.fromARGB(255, 101, 101, 101),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldProfile extends StatelessWidget {
  const TextFormFieldProfile(
      {Key? key, this.controller, this.labelText, this.keytype, this.maxlength})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final bool? keytype;
  final int? maxlength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keytype != true ? null : TextInputType.number,
      maxLength: maxlength,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
          labelText: labelText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
      controller: controller,
    );
  }
}
