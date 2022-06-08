import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.controller,
    this.title = 'Kata Sandi',
    this.text = 'Masukan Kata Sandi',
    this.passConfirmation,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String text;
  final PassConfirmation? passConfirmation;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  bool onError = false;
  String errorText = 'Error';
  int passScore = 0;
  bool change = false;
  late final bool showPassBar;

  List dataColors = [Colors.grey, Colors.grey, Colors.grey, Colors.grey];
  Map dataColorsValue = {
    0: Colors.grey,
    1: Colors.red,
    2: Colors.orange,
    3: Colors.yellow,
    4: Colors.green,
    5: Colors.green
  };

  @override
  void initState() {
    super.initState();
    showPassBar = widget.passConfirmation.runtimeType == StrengthPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
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
                onChanged: (text) {
                  setState(() {
                    int confirmation =
                        widget.passConfirmation!.confirmationFunction(text);
                    onError = confirmation == 0;
                    errorText = widget.passConfirmation!.errorText;
                    if (showPassBar) {
                      change = !change;
                      widget.passConfirmation!.reference!.data = text;
                      if (text.isNotEmpty) {
                        for (int i = 0; i < dataColors.length; i++) {
                          if (i < confirmation) {
                            // print('inhere');
                            dataColors[i] = dataColorsValue[confirmation];
                          } else {
                            dataColors[i] = dataColorsValue[0];
                          }
                        }
                      }
                    }
                  });
                },
                style: hintTitle,
                decoration: InputDecoration(
                  hintText: widget.text,
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  contentPadding: const EdgeInsets.only(
                      top: 13, bottom: 12, left: 15, right: 15),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                    // BorderSide(
                    //     // color: (widget.controller.text.length < 6)
                    //     //     ? Colors.red
                    //     //     : (widget.controller.text.length < 9)
                    //     //         ? Colors.amber
                    //     //         : Colors.green,
                    //     // style: (widget.controller.text.isEmpty)
                    //     //     ? BorderStyle.none
                    //     //     : BorderStyle.solid,
                    //     ),
                  ),
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
          showPassBar
              ? Container(
                  height: 7,
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: dataColors[0],
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Container(
                          color: dataColors[1],
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Container(
                          color: dataColors[2],
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Container(
                          color: dataColors[3],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          onError
              ? Container(
                  child: Text(errorText),
                )
              : Container(),
        ],
      ),
    );
  }
}

abstract class PassConfirmation {
  String errorText = 'Error';
  int confirmationFunction(String text);
  Map dataMessage = {};
  Reference? reference;
}

class StrengthPassword implements PassConfirmation {
  final lowerRegex = RegExp(r'[a-z]');
  final upperRegex = RegExp(r'[A-Z]');
  final numberRegex = RegExp(r'[0-9]');
  final symbolRegex = RegExp(r'[^A-Za-z0-9]');

  @override
  Reference? reference = Reference(data: '');

  @override
  Map dataMessage = {
    0: 'minimum length is 6',
    1: 'very weak',
    2: 'weak',
    3: 'good',
    4: 'strong',
    5: 'strong'
  };

  @override
  String errorText = 'Error';

  @override
  confirmationFunction(text) {
    int tempScore = 0;

    if (text.isEmpty) {
      return 1;
    }

    int upper = upperRegex.allMatches(text).length;
    int lower = lowerRegex.allMatches(text).length;
    int number = numberRegex.allMatches(text).length;
    int symbol = symbolRegex.allMatches(text).length;

    tempScore = tempScore + (text.length * 4);
    tempScore = tempScore + ((upper != 0) ? ((text.length - upper) * 2) : 0);
    tempScore = tempScore + ((lower != 0) ? ((text.length - lower) * 2) : 0);
    tempScore = tempScore + (symbol * 6);
    tempScore = (upper != 0 || lower != 0 || symbol != 0)
        ? tempScore + (number * 2)
        : tempScore + (number * 1);

    tempScore = (text.length < 8) ? tempScore - 5 : tempScore;

    tempScore = (tempScore > 100) ? 100 : tempScore;

    int score = tempScore ~/ 20;
    errorText = dataMessage[score]!;
    return score;
  }
}

class SamePassword implements PassConfirmation {
  SamePassword({required this.reference});

  @override
  Reference? reference;

  @override
  Map dataMessage = {
    0: 'must be same at password field',
    1: 'confirmation success',
  };

  @override
  String errorText = 'Error';

  @override
  confirmationFunction(text) {
    if (text == reference!.data) {
      errorText = dataMessage[1];
      return 1;
    }

    errorText = dataMessage[0];
    return 0;
  }
}

class NoneConfirmation implements PassConfirmation {
  @override
  Map dataMessage = {1: 'Success'};

  @override
  String errorText = 'Non-Error';

  @override
  int confirmationFunction(text) {
    return 1;
  }

  @override
  Reference? reference;
}

class Reference {
  Reference({required this.data});
  String data;
}
