import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
    SlideInfo('Search Food', 'Dolor est sit aliquip ad voluptate elit sint labore magna proident mollit. Commodo reprehenderit dolor sint ipsum ipsum consequat mollit. Nostrud fugiat laborum consectetur dolor labore adipisicing non mollit ex et minim quis cillum. Ea eu mollit eiusmod sint enim qui. Irure reprehenderit veniam officia dolor exercitation dolor occaecat officia dolor id cillum mollit. Aute ipsum consequat laboris sunt irure.', 'assets/images/1.png'),
    SlideInfo('Fast Delivery', 'Mollit exercitation pariatur do pariatur culpa dolore sit exercitation aliquip. Est aute Lorem est ut nisi officia tempor eu dolore commodo minim aute consequat dolor. Amet Lorem labore voluptate veniam culpa ex consectetur minim nostrud ea. Incididunt excepteur commodo ut eiusmod qui incididunt consequat exercitation sint occaecat ex quis excepteur sunt.', 'assets/images/2.png'),
    SlideInfo('Enjoy the Food!', 'Quis amet cillum ea dolor pariatur deserunt Lorem non in. Adipisicing quis in aliquip et elit Lorem amet tempor irure eiusmod officia non esse in. Aute proident et ipsum non irure laborum est ea. Fugiat officia amet cillum velit fugiat nisi. Magna excepteur ipsum commodo irure velit esse ad cupidatat adipisicing velit duis ut Lorem exercitation. Et labore pariatur velit mollit excepteur duis. Eiusmod deserunt nostrud commodo fugiat irure adipisicing eu dolore.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {

  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;

      if ( !endReached &&  page  >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width - (mediaQuery.padding.left + mediaQuery.padding.right );
    final height = mediaQuery.size.height - (mediaQuery.padding.top + mediaQuery.padding.bottom );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList(),
          ),

          Positioned(
            right: width * 0.05,
            top: height * 0.05,
            child: TextButton(
              child: const Text('Exit'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ? 
            Positioned(
              right: width * 0.05,
              bottom: height * 0.05,
              child: FadeInRight(
                from: 15,
                delay: const Duration( seconds: 1),
                child: FilledButton(
                  child: const Text('Start'),
                  onPressed: () => context.pop(),
                ),
              )
            )
            : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}