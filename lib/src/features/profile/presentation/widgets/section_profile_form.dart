import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/profile/presentation/widgets/profile_form.dart';
import '../../../../core/di/di.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_toast.dart';
import '../cubit/profile_actions.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';

class SectionProfileForm extends StatefulWidget {
  const SectionProfileForm({super.key});

  @override
  State<SectionProfileForm> createState() => _SectionProfileFormState();
}

class _SectionProfileFormState extends State<SectionProfileForm> {
  late final ProfileViewModel profileViewModel;
  late final TextEditingController usernameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isModified = false;

  String? oldUsername;
  String? oldFirstName;
  String? oldLastName;
  String? oldEmail;
  String? oldPhone;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();

    profileViewModel = getIt.get<ProfileViewModel>();
    profileViewModel.doAction(GetProfileData(context: context));

    // Add listeners to detect changes
    usernameController.addListener(_checkIfModified);
    firstNameController.addListener(_checkIfModified);
    lastNameController.addListener(_checkIfModified);
    emailController.addListener(_checkIfModified);
    phoneNumberController.addListener(_checkIfModified);
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _checkIfModified() {
    setState(() {
      // Check if any field has been modified compared to the old values
      isModified = usernameController.text != oldUsername ||
          firstNameController.text != oldFirstName ||
          lastNameController.text != oldLastName ||
          emailController.text != oldEmail ||
          phoneNumberController.text != oldPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) => profileViewModel,
      child: BlocConsumer<ProfileViewModel, ProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              ProfileForm(
                usernameController: usernameController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                passwordController: passwordController,
                phoneNumberController: phoneNumberController,
                formKey: formKey,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: isModified
                    ? () {
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> profileData = {
                            'username': usernameController.text,
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'email': emailController.text,
                            'phone': phoneNumberController.text,
                          };
                          profileViewModel.doAction(EditProfile(
                              context: context, profileData: profileData));
                        }
                      }
                    : null,
                child: CustomButton(
                  txt: AppLocalizations.of(context)!.update,
                  backgroundColor: isModified
                      ? Colors.blue
                      : Colors.grey, // Change button color if modified
                ),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is ProfileDataSuccess) {
            oldUsername = state.profileDataResponse.user?.username ?? "";
            oldFirstName = state.profileDataResponse.user?.firstName ?? "";
            oldLastName = state.profileDataResponse.user?.lastName ?? "";
            oldEmail = state.profileDataResponse.user?.email ?? "";
            oldPhone = state.profileDataResponse.user?.phone ?? "";

            usernameController.text = oldUsername!;
            firstNameController.text = oldFirstName!;
            lastNameController.text = oldLastName!;
            emailController.text = oldEmail!;
            phoneNumberController.text = oldPhone!;

            // Reset isModified state after successful data load
            setState(() {
              isModified = false;
            });
          } else if (state is EditProfileLoading) {
            CustomToast.showLoadingToast(
                message: '${AppLocalizations.of(context)!.updating}');
          } else if (state is EditProfileSuccess) {
            CustomToast.showSuccessToast(
                message: '${AppLocalizations.of(context)!.updated}');
            profileViewModel.doAction(GetProfileData(context: context));
            setState(() {
              // Reset isModified after successful update
              isModified = false;
            });
          } else if (state is EditProfileError) {
            CustomToast.showErrorToast(message: state.exception.toString());
          }
        },
      ),
    );
  }
}
