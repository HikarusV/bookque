import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key, required this.controller, this.text = 'Password'})
      : super(key: key);
  final TextEditingController controller;
  final String text;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Alamat Email',
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffE7F2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              TextField(
                controller: widget.controller,
                obscureText: !showPassword,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: widget.text,
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  contentPadding: const EdgeInsets.only(
                      top: 13, bottom: 12, left: 15, right: 15),
                  isDense: true,
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() {
                      showPassword = !showPassword;
                    }),
                    child: Icon(!showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
