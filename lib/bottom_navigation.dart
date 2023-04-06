import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie Review'),
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
        BottomNavigationBarItem(
            icon: Icon(Icons.app_registration), label: 'Form')
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/movieReview');
            break;
          case 2:
            Navigator.pushNamed(context, '/weather');
            break;
          case 3:
            Navigator.pushNamed(context, '/form');
            break;
        }
      },
    );
  }
}
