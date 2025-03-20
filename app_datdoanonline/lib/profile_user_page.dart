import 'package:app_datdoanonline/login_page.dart';
import 'package:app_datdoanonline/models/auth/login_response.dart';
import 'package:flutter/material.dart';
import 'package:app_datdoanonline/Utils/login_service.dart';
import 'package:app_datdoanonline/models/auth/user.dart';
import 'package:app_datdoanonline/widgets/account_widget.dart';
import 'package:app_datdoanonline/widgets/app_icon.dart';
import 'package:app_datdoanonline/widgets/big_text.dart';

class ProfileUserPage extends StatefulWidget {
  final LoginResponse response;

  const ProfileUserPage({super.key, required this.response});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  late Future<User?> user;

  @override
  void initState() {
    super.initState();
    user = LoginService.getCurrentUser(widget.response.accessToken);
  }

  void _logout() async {
    await LoginService.logout();
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Trigger logout function
          ),
        ],
      ),
      body: FutureBuilder<User?>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final user = snapshot.data;
            if (user != null) {
              return Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    // Profile Picture
                    AppIcon(
                      icon: Icons.person,
                      backgroundColor: const Color.fromARGB(255, 238, 138, 171),
                      iconColor: Colors.white,
                      iconSize: 75,
                      size: 150,
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Name
                            AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.person,
                                backgroundColor:
                                    const Color.fromARGB(255, 238, 138, 171),
                                iconColor: Colors.white,
                                iconSize: 25,
                                size: 50,
                              ),
                              bigText: BigText(
                                  text: "${user.firstName} ${user.lastName}"),
                            ),
                            const SizedBox(height: 20),
                            // Phone
                            AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.phone,
                                backgroundColor: Colors.yellow,
                                iconColor: Colors.white,
                                iconSize: 25,
                                size: 50,
                              ),
                              bigText: BigText(text: user.phone),
                            ),
                            const SizedBox(height: 20),
                            // Gender
                            AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.female,
                                backgroundColor: Colors.purple,
                                iconColor: Colors.white,
                                iconSize: 25,
                                size: 50,
                              ),
                              bigText: BigText(text: user.gender),
                            ),
                            const SizedBox(height: 20),
                            // Birth Date
                            AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.calendar_today,
                                backgroundColor: Colors.orange,
                                iconColor: Colors.white,
                                iconSize: 25,
                                size: 50,
                              ),
                              bigText: BigText(text: user.birthDate),
                            ),
                            // Email
                            AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.email,
                                backgroundColor: Colors.green,
                                iconColor: Colors.white,
                                iconSize: 25,
                                size: 50,
                              ),
                              bigText: BigText(text: user.email),
                            ),
                            const SizedBox(height: 20),
                            // Address (Placeholder, as no address in User object)
                            AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.location_on,
                                backgroundColor: Colors.red,
                                iconColor: Colors.white,
                                iconSize: 25,
                                size: 50,
                              ),
                              bigText: BigText(text: user.macAddress),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('User data is not available.'));
            }
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
