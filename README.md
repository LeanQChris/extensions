# Flutter Extensions Package 🚀

A comprehensive Flutter package that provides utility extensions for simplifying common tasks in Flutter development. These extensions cover Strings, Lists, BuildContext, Navigation, SnackBars, DateTime, and more. Boost your productivity by reducing boilerplate code and improving readability.

## Features

- BuildContext Extensions: Simplifies navigation, dialogs, and SnackBars.
- DateTime Extensions: Relative time, formatting, and date checks.
- List Extensions: Chunking, distinct values, and safe element access.
- String Extensions: Email validation, capitalization, URL checks, and more.
- Navigation Extensions: Manage routes with fade transitions and replacements.
- SnackBar Extensions: Easily display and manage SnackBars.

### Installation

Add the package to your pubspec.yaml:

```yaml
dependencies:
  extensions_core:
    path: <path-to-your-local-package>
```

Or publish and use it as:

```yaml
dependencies:
  extensions_core: ^0.0.1
```

Run the following command:

bash

```
flutter pub get
```

Usage

1. BuildContext Extensions
   Simplify navigation, dialogs, and SnackBars.

dart

```
import 'package:flutter/material.dart';
import 'extensions_core.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Extensions Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.showSnackBar("This is a SnackBar!"); // Show SnackBar
          },
          child: Text("Show SnackBar"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigateTo(screen: AnotherPage(), fade: true); // Navigate
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
```

2. String Extensions
   Easily validate and manipulate strings.

dart

```
import 'extensions_core.dart';

void main() {
  String email = "example@email.com";
  print(email.isEmail()); // true

  String text = "hello world";
  print(text.capitalize()); // Hello world
  print(text.toTitleCase()); // Hello World

  String url = "https://example.com";
  print(url.isUrl()); // true

  String phoneNumber = "+1234567890";
  print(phoneNumber.isPhoneNumber()); // true
}
```

3. DateTime Extensions
   Work with relative times and formatted dates.

dart

```
import 'extensions_core.dart';

void main() {
  DateTime date = DateTime.now().subtract(Duration(minutes: 10));

  print(date.timeAgo()); // "10 minutes ago"
  print(date.isToday()); // true

  String formatted = date.format("yyyy-MM-dd");
  print(formatted); // "2024-06-17"
}
```

4. List Extensions
   Perform advanced list operations like chunking, reversing, and filtering duplicates.

dart

```
import 'extensions_core.dart';

void main() {
  List<int> numbers = [1, 2, 3, 3, 4, 5, 6];

  print(numbers.takeLast(3)); // [4, 5, 6]
  print(numbers.distinct()); // [1, 2, 3, 4, 5, 6]
  print(numbers.chunked(2)); // [[1, 2], [3, 3], [4, 5], [6]]
  print(numbers.reversedList()); // [6, 5, 4, 3, 3, 2, 1]
}
```

5. Navigation Extensions
   Simplify navigation with custom transitions.

dart

```
import 'extensions_core.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.navigateTo(screen: AnotherPage(), fade: true);
          },
          child: Text("Go to Another Page"),
        ),
      ),
    );
  }
}
```

6. SnackBar Extensions
   Quickly show and manage SnackBars.

dart

```
import 'extensions_core.dart';

void main(BuildContext context) {
  context.showSnackBar("This is a SnackBar!");
  context.removeSnackBar();
}
```

### API Reference

#### BuildContext Extensions

- showSnackBar(String message): Show a SnackBar.
- navigateTo({required Widget screen, bool fade}): Navigate to a new - screen with optional fade transition.
- showCusDialog(Widget dialog): Show a custom dialog.
- removeSnackBar(): Remove the current SnackBar.

#### String Extensions

- isEmail(): Checks if the string is a valid email.
- capitalize(): Capitalizes the first letter of the string.
- isUrl(): Checks if the string is a valid URL.
- reverse(): Reverses the string.
- truncate(int maxLength): Truncates the string with an optional ellipsis.

#### DateTime Extensions

- isToday(): Checks if the date is today.
  timeAgo(): Returns a relative time string like "5 minutes ago".
  format(String pattern): Formats the date using a pattern.

#### List Extensions

isNullOrEmpty(): Checks if the list is null or empty.
takeLast(int n): Returns the last n elements.
chunked(int chunkSize): Splits the list into chunks.
distinct(): Removes duplicate values.

#### Requirements

```
Flutter: >=1.17.0
Dart SDK: >=3.6.0
Dependencies:
intl: ^0.20.1
```

License
This project is licensed under the MIT License.

Credits
Developed with ❤️ by Chris Thapa. 🚀
