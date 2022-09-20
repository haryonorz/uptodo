import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uptodo/modules/register/controller/register_controller.dart';
import 'package:uptodo/shared/widgets/text_form_field_label.dart';

class RegisterFormView extends GetView<RegisterController> {
  RegisterFormView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
          SizedBox(height: 20.h),
          TextFormFieldLabel(
            labelText: 'Confirm Password',
            hintText: 'Enter your Confirm Password',
            controller: controller.confirmPasswordController,
            obscureText: true,
          ),
          const Spacer(),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    controller.formValidate ? controller.formSubmit : null,
                child: Text(
                  'Register',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
