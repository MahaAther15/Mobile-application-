import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/ghost_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            Text(
              'The Floral\nAtelier',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'WELCOME BACK TO THE WORLD OF BOTANICAL PRESTIGE.',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppTheme.outline,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 60),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'EMAIL ADDRESS',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'PASSWORD',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'FORGOT PASSWORD?',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 10,
                        color: AppTheme.richGold,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              label: 'Sign In',
              onPressed: () => context.go('/'),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 10,
                          color: AppTheme.outline.withValues(alpha: 0.5),
                        ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 24),
            GhostButton(
              label: 'Continue with Google',
              onPressed: () {},
              icon: Icons.g_mobiledata,
            ),
            const SizedBox(height: 60),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                    text: "DON'T HAVE AN ACCOUNT? ",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 10,
                          color: AppTheme.outline,
                        ),
                    children: [
                      TextSpan(
                        text: 'CREATE ONE',
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
