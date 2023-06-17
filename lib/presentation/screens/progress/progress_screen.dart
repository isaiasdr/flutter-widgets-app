import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;

    return Center(
      child: Column(
        children: [
          SizedBox( height: height * 0.03 ),
          const Text('Circular progress indicator'),
          SizedBox( height: height * 0.03 ),
          const CircularProgressIndicator( strokeWidth: 2, backgroundColor: Colors.black45,),

          SizedBox( height: height * 0.05 ),
          const Text('Circular and Linear indicator Controlled'),
          SizedBox( height: height * 0.03 ),
          const _ControlledProgressIndicator(),


        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return StreamBuilder(
      stream: Stream.periodic( const Duration( milliseconds: 300 ), (value) => (value + 2) / 100 )
        .takeWhile((value) => value < 1),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12, ),
              SizedBox(width: width * 0.05),
              Expanded(
                child: LinearProgressIndicator( value: progressValue, )
              )
            
          ]),
        );
      }
    );
  }
}