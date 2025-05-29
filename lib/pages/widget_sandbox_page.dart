import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetSandboxPage extends ConsumerWidget {
  const WidgetSandboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Sandbox'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Text and Styles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),
            const Text(
              'This is a regular Text widget.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'This text uses a custom style!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).hintColor,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            const Divider(),

            const Text(
              'Buttons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ElevatedButton Pressed!')),
                );
              },
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('TextButton Pressed!')),
                );
              },
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OutlinedButton Pressed!')),
                );
              },
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('IconButton Pressed!')),
                );
              },
              icon: const Icon(Icons.star),
              tooltip: 'Favorite',
            ),
            const SizedBox(height: 20),

            const Text(
              'Images and Icons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),
            Image.network(
              'https://cataas.com/cat',
              width: 150,
              height: 150,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 10),
            const Icon(Icons.pets, size: 50, color: Colors.deepOrange),
            const SizedBox(height: 20),

            const Text(
              'Text Inputs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
                letterSpacing: 12,
                wordSpacing: 0.1,
                height: 1,
                backgroundColor: Colors.cyanAccent,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.wavy,
                decorationThickness: 2,
              ),
            ),
            const Divider(),
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLength: 20,
              maxLines: 4,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                icon: Icon(Icons.car_crash),
                labelText: 'Standard Input',
                errorText: 'wrong, wrong',
                suffix: Text('&&'),
                prefix: Text('@@'),
                filled: true,
                fillColor: Colors.blueGrey,
                suffixIcon: Icon(Icons.alarm),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Input with Hint',
                helperText: 'heeelp',
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.white10,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            const Text(
              'Lists (limited example)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),

            Column(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.format_list_numbered),
                    title: Text('List Item ${index + 1}'),
                    subtitle: Text('Subtitle for item ${index + 1}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    selected: false,
                    tileColor: Colors.blue,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.blue, width: 2),
                    ),
                    dense: true,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tapped List Item ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Layouts (basic)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  transform: Matrix4.rotationZ(0.2),
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text('R1')),
                ),
                Container(
                  transform: Matrix4.translationValues(20.0, -10.0, 0),
                  width: 50,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('R2')),
                ),
                Container(
                  transform: Matrix4.diagonal3Values(1.5, 1.5, 1.0),
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('R3')),
                ),
                Container(
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, -0.01)
                        ..rotateX(0.3),
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('R4')),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 150, height: 150, color: Colors.purple),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(width: 80, height: 80, color: Colors.yellow),
                ),
                const Text(
                  'Stack Item',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Progress Indicators',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),
            const CircularProgressIndicator(
              color: Colors.amber,
              strokeWidth: 10,
            ),
            const SizedBox(height: 20),
            const LinearProgressIndicator(),
            const SizedBox(height: 20),

            const Text(
              'Dialogs & Alerts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(160),
                      ),
                      title: const Text('Sample Dialog'),
                      content: const Text('This is a basic alert dialog.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Dialog'),
            ),
            const SizedBox(height: 20),

            // --- Seção 9: Switches & Checkboxes ---
            const Text(
              'Switches & Checkboxes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Divider(),
            Consumer(
              builder: (context, ref, _) {
                final isSwitched = ref.watch(_switchProvider);
                return SwitchListTile(
                  title: const Text('Enable Feature'),
                  value: isSwitched,
                  onChanged: (bool value) {
                    ref.read(_switchProvider.notifier).state = value;
                  },
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final isChecked = ref.watch(_checkboxProvider);
                return CheckboxListTile(
                  title: const Text('Agree to Terms'),
                  value: isChecked,
                  onChanged: (bool? value) {
                    if (value != null) {
                      ref.read(_checkboxProvider.notifier).state = value;
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // --- Adicione mais seções e widgets aqui! ---
            // Por exemplo: Radio buttons, Sliders, DropdownButton, DatePicker, etc.
            // Para manter a organização, use Text e Divider para novas seções.
          ],
        ),
      ),
    );
  }
}

// Provedores Riverpod para gerenciar o estado dos Switches/Checkboxes
final _switchProvider = StateProvider<bool>((ref) => false);
final _checkboxProvider = StateProvider<bool>((ref) => false);
