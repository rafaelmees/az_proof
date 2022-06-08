import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: SvgPicture.asset(
                    'assets/images/reduzido.svg',
                    clipBehavior: Clip.antiAlias,
                  ),
                ),
                SizedBox(height: 42),
                SizedBox(
                  width: 358,
                  child: Form(
                    key: controller.formKey,
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'E-mail',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFE7C6E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                style: TextStyle(fontSize: 14),
                                controller: controller.emailController,
                                focusNode: controller.emailFocus,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Color(0xFFFE7C6E),
                                validator: (value) =>
                                    controller.validateEmail(value ?? ''),
                                onChanged: (value) =>
                                    controller.checkEmailError = false,
                                onTap: () {
                                  controller.setFocusOnEmail();
                                  setState(() {});
                                },
                                enabled: !controller.loading,
                                decoration: InputDecoration(
                                  hintText: 'seuemail@exemplo.com',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hoverColor: Colors.transparent,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                      color: Color(0xFFFE7C6E),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFE30F0F),
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    controller.checkEmailError
                                        ? PhosphorIcons.x_circle_fill
                                        : null,
                                    color: !controller.checkEmailError
                                        ? null
                                        : Color(0xFFE30F0F),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 19),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Senha',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFE7C6E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                style: TextStyle(fontSize: 14),
                                controller: controller.passwordController,
                                focusNode: controller.passwordFocus,
                                obscureText: controller.showPassword,
                                textInputAction: TextInputAction.done,
                                validator: (value) =>
                                    controller.validatePassword(value ?? ''),
                                onChanged: (_) =>
                                    controller.checkPasswordError = false,
                                onTap: () {
                                  controller.setFocusOnPassword();
                                  setState(() {});
                                },
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: Color(0xFFFE7C6E),
                                enabled: !controller.loading,
                                decoration: InputDecoration(
                                  hintText: '•••••••••',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hoverColor: Colors.transparent,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                      color: Color(0xFFFE7C6E),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFE30F0F),
                                    ),
                                  ),
                                  suffixIcon: !controller.checkPasswordError
                                      ? InkWell(
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.white,
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          onTap: () {
                                            controller.showPassword =
                                                !controller.showPassword;

                                            controller.setFocusOnPassword();

                                            setState(() {});
                                          },
                                          child: Icon(
                                            controller.showPassword
                                                ? PhosphorIcons.eye_slash
                                                : PhosphorIcons.eye,
                                            color: !controller
                                                    .passwordFocus.hasFocus
                                                ? Colors.grey.shade600
                                                : Color(0xFFFE7C6E),
                                            size: 20,
                                          ),
                                        )
                                      : Icon(
                                          PhosphorIcons.x_circle_fill,
                                          color: Color(0xFFE30F0F),
                                          size: 20,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 56),
                            child: Obx(
                              () => ElevatedButton(
                                onPressed: () async {
                                  if (controller.formKey.currentState != null &&
                                      controller.formKey.currentState!
                                          .validate()) {
                                    controller.loading = true;

                                    bool response =
                                        await controller.signInController(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                    );

                                    if (response) {
                                      Get.offAndToNamed(Routes.HOME);
                                    } else {
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Aviso',
                                          message: controller.error,
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Color(0xFFFBB03B),
                                          icon: Icon(
                                            Icons.warning,
                                            color: Colors.white,
                                          ),
                                          isDismissible: true,
                                          duration: Duration(seconds: 4),
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 32,
                                            right: 32,
                                            bottom: 16,
                                          ),
                                        ),
                                      );
                                    }
                                    controller.loading = false;
                                  }
                                },
                                child: controller.loading
                                    ? const SizedBox(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                            Colors.white,
                                          ),
                                        ),
                                        height: 18,
                                        width: 18,
                                      )
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(0xFFFE7C6E),
                                  ),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    const Size.fromHeight(48),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, bottom: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  '® Desenvolvido por Azape',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8F95B2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
