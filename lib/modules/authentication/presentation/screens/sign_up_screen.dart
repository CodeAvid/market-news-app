import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/router/app_routes.dart';
import 'package:market_news_app/core/utils/form_validation.dart';
import 'package:market_news_app/core/utils/utils.dart';
import 'package:market_news_app/core/widgets/custom_textfield.dart';
import 'package:market_news_app/modules/authentication/config/params/user_params.dart';
import 'package:market_news_app/modules/authentication/presentation/cubit/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isEnabled = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController?.dispose();
    _lastNameController?.dispose();
    _isEnabled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomAutoSizeText(
              'Your legal name',
              style: context.bodyMedium?.copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 20.sp, left: 20.sp, top: 12.sp),
          child: Form(
            key: _formKey,
            onChanged: () {
              _checkIfFormIsValid();
            },
            child: Column(
              children: [
                CustomAutoSizeText(
                  'We need to know a bit about you so that we can create your account.',
                  style: context.bodyLarge?.copyWith(
                    color: Color(0xFF737373),
                    fontSize: 16.sp,
                  ),
                ),
                VerticalSpace(10.h),
                CustomTextField(
                  controller: _firstNameController,
                  hintText: 'First name',
                  validator: (value) {
                    return context.validateNotEmptyField(
                      value,
                      'First name',
                    );
                  },
                ),
                VerticalSpace(10.h),
                CustomTextField(
                  controller: _lastNameController,
                  hintText: 'Last name',
                  validator: (value) {
                    return context.validateNotEmptyField(
                      value,
                      'Last name',
                    );
                  },
                ),
                Spacer(),
                // LoadingButton(
                //   showBox: true,
                //   primaryColor: Colors.white,
                //   iconColor: Colors.deepPurpleAccent,
                //   valueColor: const Color(0xff0066ff),
                //   errorColor: const Color(0xffe0333c),
                //   successColor: const Color(0xff58B09C),
                //   iconData: Icons.arrow_forward_ios,
                //   onPressed: () {
                //     Future.delayed(const Duration(seconds: 1), () {
                //       _btnController3.error();
                //       Future.delayed(const Duration(seconds: 2), () {
                //         _btnController3.reset();
                //       });
                //     });
                //   },
                //   successIcon: Icons.arrow_forward_ios,
                //   controller: _btnController3,
                // ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    switch (state) {
                      case SaveUserSuccessful():
                        context.go(Routes.activateNotification);
                      case AuthError():
                      default:
                    }
                    if (state is SaveUserSuccessful) {
                    } else if (state is AuthError) {}
                  },
                  child: ValueListenableBuilder(
                    valueListenable: _isEnabled,
                    builder: (BuildContext context, bool isEnable, Widget? child) {
                      return ArgonButton(
                        height: 60,
                        roundLoadingShape: false,
                        width: 200,
                        onTap: isEnable ? _signUpUser : null,
                        loader: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            HorizontalSpace(10.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        borderRadius: 40.0,
                        color: isEnable ? context.primaryColor : context.primaryContainerColor,
                      );
                    },
                  ),
                ),
                VerticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUpUser(
    Function startLoading,
    Function stopLoading,
    ArgonButtonState btnState,
  ) async {
    if (_formKey.currentState!.validate()) {
      startLoading();
      final user = UserParams(
        firstName: _firstNameController!.text,
        lastName: _lastNameController!.text,
      );
      await context.read<AuthCubit>().saveUser(user);
    }
  }

  void _checkIfFormIsValid() {
    if (_firstNameController!.text.isNotEmpty && _lastNameController!.text.isNotEmpty) {
      _isEnabled.value = true;
    } else {
      _isEnabled.value = false;
    }
  }
}
