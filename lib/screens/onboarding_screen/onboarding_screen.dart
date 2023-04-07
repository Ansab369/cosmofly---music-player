import 'package:cosmofly/logic/logic_provider.dart';
import 'package:flutter/material.dart';
import '/route.dart' as route;
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider =
        Provider.of<OnboardingProvider>(context, listen: true);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboard_bg.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
              begin: Alignment(-0.16088707745075226, 0.9168827533721924),
              end: Alignment(-0.9168827533721924, -0.7534888386726379),
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromRGBO(15, 8, 23, 1),
                Color.fromRGBO(15, 8, 23, 1),
              ]),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/Cosmofly.png'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 290,
                child: Column(
                  children: [
                    const Text(
                      'Feel The Beat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Enjoy The Best Music Experience\n With Cosmofly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        onboardingProvider.setOnboarded();
                        Navigator.pushReplacementNamed(
                            context, route.homeScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(75, 10, 113, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
