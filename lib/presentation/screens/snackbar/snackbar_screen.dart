import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar ( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hello world'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialoag( BuildContext context ) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Pariatur et consectetur est labore occaecat. Non duis exercitation cillum ad dolore est quis exercitation officia velit laborum commodo. Aliquip non velit officia excepteur exercitation eiusmod eu sint ut amet irure proident nulla. Voluptate incididunt fugiat minim quis laboris Lorem in amet fugiat non ullamco incididunt ullamco. Sint nisi velit incididunt anim tempor proident.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancel')
          ),

          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Accept')
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Duis eu veniam sit cupidatat veniam cupidatat consequat occaecat incididunt non amet nulla quis exercitation. Ex quis adipisicing ex deserunt. Id esse velit mollit culpa veniam esse consectetur tempor anim aliquip. Tempor laborum anim proident enim velit reprehenderit. Id ut eiusmod dolore deserunt culpa laboris laboris dolor veniam.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialoag(context), 
              child: const Text('Mostrar Dialogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar(context), 
      ),
    );
  }
}