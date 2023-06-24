import 'package:cloudimage_360_view/cloudimage_360_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Image 360 View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool autoRotate = true;
  bool allowSwipe = true;
  int swipeSensitivity = 1;
  int rotationCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TileBuilder(
                headerTitle: 'Horizontal(x) Axis Only Eaxmple',
                child: Ci360View(
                  xImageModel: Ci360ImageModel.horizontal(
                    imageFolder: 'https://demoshow2023.s3.amazonaws.com/roam/',
                    imageName: (index) => '$index.jpg',
                    imagesLength: 1387,
                  ),
                  options: Ci360Options(
                    swipeSensitivity: swipeSensitivity,
                    autoRotate: autoRotate,
                    rotationCount: rotationCount,
                    allowSwipeToRotate: allowSwipe,
                    onImageChanged: (index, reason, axis) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TileBuilder extends StatelessWidget {
  const _TileBuilder({
    required this.headerTitle,
    required this.child,
    Key? key,
  }) : super(key: key);

  final String headerTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            headerTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          child,
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:imageview360/imageview360.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// // class MyHomePage extends StatelessWidget {
// //   const MyHomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Panorama Demo'),
// //       ),
// //       body: Center(
// //         child: Panorama(
// //           child: Image.asset('assets/test.jpg'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<ImageProvider> imageList = <ImageProvider>[];
//   bool autoRotate = true;
//   int rotationCount = 1;
//   int swipeSensitivity = 1;
//   bool allowSwipeToRotate = true;
//   RotationDirection rotationDirection = RotationDirection.clockwise;
//   Duration frameChangeDuration = const Duration(milliseconds: 50);
//   bool imagePrecached = false;

//   @override
//   void initState() {
//     //* To load images from assets after first frame build up.
//     WidgetsBinding.instance
//         .addPostFrameCallback((_) => updateImageList(context));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ImageView360 Demo'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 72.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 (imagePrecached == true)
//                     ? ImageView360(
//                         key: UniqueKey(),
//                         imageList: imageList,
//                         autoRotate: autoRotate,
//                         rotationCount: rotationCount,
//                         rotationDirection: rotationDirection,
//                         frameChangeDuration: frameChangeDuration,
//                         swipeSensitivity: swipeSensitivity,
//                         allowSwipeToRotate: allowSwipeToRotate,
//                         onImageIndexChanged: (currentImageIndex) {
//                           print("currentImageIndex: $currentImageIndex");
//                         },
//                       )
//                     : const Text("Pre-Caching images..."),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Optional features:",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                         fontSize: 24),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Text("Auto rotate: $autoRotate"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Text("Rotation count: $rotationCount"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Text("Rotation direction: $rotationDirection"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Text(
//                       "Frame change duration: ${frameChangeDuration.inMilliseconds} milliseconds"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child:
//                       Text("Allow swipe to rotate image: $allowSwipeToRotate"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Text("Swipe sensitivity: $swipeSensitivity"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void updateImageList(BuildContext context) async {
//     // roam
//     for (int i = 0; i <= 1386; i++) {
//       String zeros = '';
//       if (i < 10) {
//         zeros = '0000';
//       } else if (i >= 10 && i < 100) {
//         zeros = '000';
//       } else if (i >= 100 && i < 1000) {
//         zeros = '00';
//       } else if (i >= 1000 && i < 1387) {
//         zeros = '0';
//       }

//       imageList.add(AssetImage('assets/roam/148户型_$zeros$i.jpg'));

//       // rotate
//       // for (int i = 150; i >= 0; i--) {
//       //   String zeros = '';
//       //   if (i < 10) {
//       //     zeros = '0000';
//       //   } else if (i >= 10 && i < 100) {
//       //     zeros = '000';
//       //   } else if (i >= 100 && i < 151) {
//       //     zeros = '00';
//       //   }

//       //   imageList.add(AssetImage('assets/rotate/B13_$zeros$i.jpg'));

//       //* To precache images so that when required they are loaded faster.
//       // await precacheImage(
//       //     AssetImage('assets/rotate/B13_$zeros$i.jpg'), context);
//     }
//     setState(() {
//       imagePrecached = true;
//     });
//   }
// }
