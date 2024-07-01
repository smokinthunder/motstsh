import 'package:flutter/material.dart';


class LoginTextBox extends StatefulWidget {
  final String hintText;
  void Function(String) whenChanged;
  final bool ifpassword;
  bool showPassword = false;
  LoginTextBox({
    super.key,
    required this.hintText,
    required this.whenChanged,
    this.ifpassword = false,
  });

  @override
  State<LoginTextBox> createState() => _LoginTextBoxState();
}

class _LoginTextBoxState extends State<LoginTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(4, 4),
            ),
          ]),
      child: TextField(
        onChanged: (value) => widget.whenChanged(value),
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          suffixIcon: widget.ifpassword
              ? InkWell(
                  child: Icon(widget.showPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      widget.showPassword = !widget.showPassword;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class LoginSubmitButton extends StatelessWidget {
  String txt;
  LoginSubmitButton({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(
        left: 125,
        top: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFA70018),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Color(0xFF540000),
              offset: Offset(0, 4),
              spreadRadius: 2,
            )
          ]),
      child: Text(
        txt,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
