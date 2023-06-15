import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation? selectedTranspotation;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text('Developer Mode'),
          subtitle: const Text('Additional controls'),
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          })
        ),
        ExpansionTile(
          title: const Text('Transport Vehicule'),
          subtitle: Text('$selectedTranspotation'),
          children: [
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Car Option'),
                value: Transportation.car,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = value;
                    })),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Boat Option'),
                value: Transportation.boat,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = value;
                    })),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Plane Option'),
                value: Transportation.plane,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = value;
                    })),
            RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Submarine Option'),
                value: Transportation.submarine,
                groupValue: selectedTranspotation,
                onChanged: (value) => setState(() {
                      selectedTranspotation = value;
                    })),
          ],
        ),

        ExpansionTile(
          title: const Text('Wants Food?'),
          children: [
            CheckboxListTile(
              title: const Text('Wants Breakfast?'),
              subtitle: const Text('Yes or no?'),
              value: wantsBreakfast,
              onChanged: (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }),
            ),

            CheckboxListTile(
              title: const Text('Wants Lunch?'),
              subtitle: const Text('Yes or no?'),
              value: wantsLunch,
              onChanged: (value) => setState(() {
                wantsLunch = !wantsLunch;
              }),
            ),

            CheckboxListTile(
              title: const Text('Wants Dinner?'),
              subtitle: const Text('Yes or no?'),
              value: wantsDinner,
              onChanged: (value) => setState(() {
                wantsDinner = !wantsDinner;
              }),
            )
          ],
        )
      ],
    );
  }
}
