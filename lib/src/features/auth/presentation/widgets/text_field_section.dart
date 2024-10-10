import 'package:flutter/material.dart';
import 'package:online_exam_app/src/features/auth/presentation/widgets/custom_text_form_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Enter your user name',
          labelText: 'User Name',
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
              hintText: 'Enter first name',
              labelText: 'First Name',
            )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: CustomTextFormField(
              hintText: 'Enter last name',
              labelText: 'Last Name',
            )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: 'Enter your Email',
          labelText: 'Email',
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
              hintText: 'Enter password',
              labelText: 'Passwoed',
            )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: CustomTextFormField(
              hintText: 'Confirm password',
              labelText: 'Password',
            )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: 'Enter phone number',
          labelText: 'Phone Number',
        ),
      ],
    );
  }
}
