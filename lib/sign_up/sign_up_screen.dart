import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: textTheme.headline5,
            ),
            Text(
              'Gunpla Database',
              style: textTheme.headline4,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: isLoading
                  ? null
                  : () {
                      final backend = context.read<Backend>();
                      backend.signUp();
                      setState(() {
                        isLoading = true;
                      });
                    },
              icon: const Text(''),
              label: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
