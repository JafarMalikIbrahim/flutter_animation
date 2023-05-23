import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(owlUrl),
        TextButton(
          child: const Text(
            'Show Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => _animationController.forward(),
        ),
        AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Column(
                children: [
                  Text(
                    'Type: Owl',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Age: 39',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Employment: None',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}


// import 'dart:math';

// import 'package:flutter/material.dart';

// const _duration = Duration(milliseconds: 400);

// double randomBorderRadius() {
//   return Random().nextDouble() * 64;
// }

// double randomMargin() {
//   return Random().nextDouble() * 64;
// }

// Color randomColor() {
//   return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
// }

// class AnimatedContainerDemo extends StatefulWidget {
//   const AnimatedContainerDemo({Key? key}) : super(key: key);

//   @override
//   State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
// }

// class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
//   late Color color;
//   late double borderRadius;
//   late double margin;

//   @override
//   initState() {
//     super.initState();
//     color = randomColor();
//     borderRadius = randomBorderRadius();
//     margin = randomMargin();
//   }

//   void change() {
//     setState(() {
//       color = randomColor();
//       borderRadius = randomBorderRadius();
//       margin = randomMargin();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         title: Text(
//           'Implicit Animation',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 2,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple[500],
//         elevation: 0,
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: SizedBox(
//                   width: 200,
//                   height: 200,
//                   child: AnimatedContainer(
//                     margin: EdgeInsets.all(margin),
//                     decoration: BoxDecoration(
//                       color: color,
//                       borderRadius: BorderRadius.circular(borderRadius),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.3),
//                           blurRadius: 8,
//                           offset: Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     duration: _duration,
//                     curve: Curves.easeInOutBack,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 24),
//             ElevatedButton(
//               child: Text(
//                 'Change',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.deepPurple[500],
//                 onPrimary: Colors.white,
//                 textStyle: TextStyle(fontSize: 16),
//                 padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 elevation: 2,
//               ),
//               onPressed: () => change(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AnimatedContainerDemo(),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }
