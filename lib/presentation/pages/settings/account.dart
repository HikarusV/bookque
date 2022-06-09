import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/widgets/custom/full_button.dart';
import 'package:bookque/presentation/widgets/custom/password_field.dart';
import 'package:bookque/presentation/widgets/custom/text_input.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/settings/profile_picture.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Akun',
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ProfilePicture(),
              TextInput(
                controller: nameController,
                textHint: 'Masukkan Nama Lengkap',
                title: 'Nama',
              ),
              TextInput(
                controller: emailController,
                textHint: 'Masukkan Alamat Email',
                title: 'Email',
              ),
              PasswordField(
                controller: passController,
                title: 'Kata Sandi',
              ),
              PasswordField(
                controller: confirmPassController,
                title: 'Konfirmasi Kata Sandi',
                textHint: 'Masukan Kembali Kata Sandi',
              ),
              FullButton(
                text: 'Simpan',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
