# Declarative Text Form Field

A Flutter widget that provides a `TextFormField` that can be controlled declaratively, without the need for a `TextEditingController`. This simplifies state management, especially in scenarios where the text field's value needs to be changed programmatically from outside the widget.

## Motivation

Standard `TextFormField`s in Flutter require a `TextEditingController` to read or modify their content from outside. This involves:
-   Creating a `TextEditingController`.
-   Managing its lifecycle by disposing of it when it's no longer needed.
-   Adding listeners to the controller to react to changes.
-   Updating the controller's `text` property to programmatically change the field's content.

This can add significant boilerplate, especially in complex forms or when you are already managing state declaratively (e.g., using `setState`, `Provider`, `Bloc`, or other state management solutions).

`DeclarativeTextFormField` abstracts away the controller, allowing you to work directly with a `String` variable.

## Features

-   **Declarative:** Bind the text field directly to a string in your state.
-   **No `TextEditingController` needed:** Simplifies your widget's code and lifecycle management.
-   **Full-featured:** Implements all the properties of the standard `TextFormField`, so you don't lose any customization options (`decoration`, `validator`, `style`, etc.).
-   **Two-way binding:** Updates the state on user input and updates the UI when the state changes.

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  declarative_text_form_field: ^1.0.0 # Use the latest version
```

Then, install packages from the command line:

```shell
flutter pub get
```

## Usage

Import the package in your Dart code:

```dart
import 'package:declarative_text_form_field/declarative_text_form_field.dart';
```

Here is a simple example demonstrating how to use `DeclarativeTextFormField`:

```dart
class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DeclarativeTextFormField(
          text: _name,
          onChanged: (value) => setState(() => _name = value),
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Text('Hello, $_name!'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => _name = 'Flutter'),
          child: const Text('Say Hi to Flutter'),
        ),
      ],
    );
  }
}
```

### Explanation

1.  **`_name`**: A simple `String` in `_MyFormState` holds the value for the text field.
2.  **`DeclarativeTextFormField`**:
    -   The `text` property is bound to the `_name` variable. The field will always display the current value of `_name`.
    -   The `onChanged` callback is triggered whenever the user types in the field. It calls `setState` to update `_name` with the new value.
3.  **`ElevatedButton`**:
    -   When the button is pressed, it calls `setState` and updates `_name` to `'Flutter'`.
    -   Because `DeclarativeTextFormField` is bound to `_name`, it automatically updates to show the new text.

This demonstrates the declarative, two-way data flow without any manual controller management.
