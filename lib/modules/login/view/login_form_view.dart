import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uptodo/modules/login/controller/login_controller.dart';
import 'package:uptodo/shared/widgets/text_form_field_label.dart';

class LoginFormView extends GetView<LoginController> {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        TextFormFieldLabel(
          labelText: 'Username',
          hintText: 'Enter your Username',
          controller: controller.usernameController,
        ),
        SizedBox(height: 20.h),
        TextFormFieldLabel(
          labelText: 'Password',
          hintText: 'Enter your Password',
          controller: controller.passwordController,
          obscureText: true,
        ),
        const Spacer(),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.formValidate ? controller.formSubmit : null,
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
