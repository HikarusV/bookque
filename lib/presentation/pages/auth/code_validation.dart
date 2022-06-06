import 'package:bookque/presentation/widgets/custom/send_email_verification_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/styles.dart';

class CodeValidation extends StatelessWidget {
  const CodeValidation(
      {Key? key,
      required this.controller,
      required this.whenValid,
      required this.whenError})
      : super(key: key);

  final TextEditingController controller;
  final VoidCallback whenValid;
  final VoidCallback whenError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kami telah mengirim kode verifikasi ke email kamu',
                style: titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Image.asset(
                  'assets/verification.png',
                  height: 200,
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  'Masukkan kode verifikasi',
                  style: titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              ClipRRect(
                child: Center(
                  child: SizedBox(
                    width: 290,
                    child: TextField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      onChanged: (text) async {
                        if (text.length == 6) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          if (await isValid('333')) {
                            whenValid();
                          } else {
                            Navigator.pop(context);
                            whenError();
                          }
                        }
                      },
                      textAlign: TextAlign.justify,
                      maxLines: 1,
                      maxLength: 6,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      cursorHeight: 0,
                      cursorWidth: 0,
                      style: const TextStyle(
                        letterSpacing: 30,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        hintText: '------',
                        contentPadding: const EdgeInsets.all(12),
                        // isDense: true,
                        focusedBorder: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder(),
                        counterText: '',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SendEmailVerificationAgain(
                  whenPressed: () => print('Sending again'))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> isValid(String code) async {
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }
}
