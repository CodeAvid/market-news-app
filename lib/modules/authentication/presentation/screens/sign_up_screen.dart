import 'package:market_news_app/core/global_imports.dart';
import 'package:market_news_app/core/router/app_routes.dart';
import 'package:market_news_app/core/utils/form_validation.dart';
import 'package:market_news_app/core/utils/utils.dart';
import 'package:market_news_app/core/widgets/animated_button.dart';
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

  bool _keyboardIsOpen = false;

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
    _keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
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
        child: SingleChildScrollView(
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
                  // Spacer(),
                  VerticalSpace(20.h), // Add vertical space
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      switch (state) {
                        case SaveUserSuccessful():
                          context.go(Routes.activateNotification);
                        case AuthError():
                        default:
                      }
                    },
                    builder: (context, state) {
                      return ValueListenableBuilder(
                        valueListenable: _isEnabled,
                        builder: (BuildContext context, bool isEnable, Widget? child) {
                          return AnimatedButton(
                            isLoading: state is AuthLoading,
                            isEnable: isEnable,
                            keyboardIsOpen: _keyboardIsOpen,
                            onPressed: () {
                              _signUpUser();
                            },
                          );
                        },
                      );
                    },
                  ),
                  VerticalSpace(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUpUser() async {
    if (_formKey.currentState!.validate()) {
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
