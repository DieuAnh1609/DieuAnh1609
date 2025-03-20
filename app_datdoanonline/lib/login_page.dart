import 'package:app_datdoanonline/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_datdoanonline/Utils/login_service.dart';
import 'package:app_datdoanonline/models/auth/login_request.dart';
import 'package:app_datdoanonline/models/auth/login_response.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    bool isEmail(String email) {
      String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      RegExp regex = RegExp(emailPattern);
      return regex.hasMatch(email);
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 50),
                _buildTitle(),
                const SizedBox(height: 60),
                _buildEmailField(emailController, isEmail),
                const SizedBox(height: 12.0),
                _buildPasswordField(passController),
                const SizedBox(height: 12.0),
                _buildRememberMe(),
                const SizedBox(height: 20),
                _buildContinueButton(
                    context, formKey, emailController, passController),
                const SizedBox(height: 40),
                _buildSocialButtons(),
                const SizedBox(height: 50),
                _buildSignUpPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Phương thức xây dựng tiêu đề
  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          "Đăng nhập",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ],
    );
  }

  // Phương thức xây dựng trường Email
  Widget _buildEmailField(
      TextEditingController emailController, bool Function(String) isEmail) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: const Icon(Icons.email_outlined),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.pink, width: 1),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your email!";
        } else if (!isEmail(value)) {
          return "The email format is incorrect!";
        }
        return null;
      },
    );
  }

  // Phương thức xây dựng trường Mật khẩu
  Widget _buildPasswordField(TextEditingController passController) {
    return TextFormField(
      controller: passController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        suffixIcon: const Icon(Icons.lock_outline),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.pink, width: 1),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password!';
        }
        return null;
      },
    );
  }

  // Phương thức xây dựng Checkbox "Nhớ mật khẩu" và nút "Quên mật khẩu"
  Widget _buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const Text("Nhớ mật khẩu"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Quên mật khẩu",
            style: TextStyle(color: Colors.pink),
          ),
        ),
      ],
    );
  }

  String removeEmailDomain(String email) {
    return email.split('@').first;
  }

  // Phương thức xây dựng nút "Đăng nhập"
  Widget _buildContinueButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passController) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          String email = removeEmailDomain(emailController.text);
          LoginResponse? result = await LoginService.login(
              LoginRequest(email: email, password: passController.text));
          if (result != null) {
            // Chuyển hướng đến HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(response: result),
              ),
            );
          } else {
            // Hiển thị thông báo nếu đăng nhập thất bại
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đăng nhập thất bại'),
                backgroundColor: Colors.blue,
              ),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: const Text(
        "Đăng nhập",
        style: TextStyle(fontSize: 18.0,color: Colors.white),
      ),
    ),
  );
}


  // Phương thức xây dựng các nút social media
  Widget _buildSocialButtons() {
    return Column(
      children: [
        const Text(
          "Hoặc",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            _buildSocialButton(
              icon: Icons.g_mobiledata,
              label: "Tiếp tục với Google",
              backgroundColor: Colors.white,
              iconColor: Colors.red,
            ),
            const SizedBox(height: 12),
            _buildSocialButton(
              icon: Icons.facebook,
              label: "Tiếp tục với Facebook",
              backgroundColor: Colors.white,
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 12),
            _buildSocialButton(
              icon: Icons.apple,
              label: "Tiếp tục với Apple",
              backgroundColor: Colors.white,
              iconColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Bạn chưa có tài khoản? "),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Đăng ký ngay",
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
