# Extensions Core

A comprehensive collection of Dart and Flutter extensions that enhance development productivity and code readability.

[![pub package](https://img.shields.io/pub/v/extensions_core.svg)](https://pub.dev/packages/extensions_core)

## Features

This package provides a rich set of extensions for common Flutter and Dart types:

- **String Extensions**: Powerful string manipulation and validation methods
- **List Extensions**: Enhanced list manipulation utilities
- **DateTime Extensions**: Date formatting and relative time handling
- **BuildContext Extensions**: Simplified UI interactions (alerts, snackbars)
- **Theme Extensions**: Easy theme access and manipulation
- **Navigation Extensions**: Streamlined navigation helpers
- **Widget Extensions**: Chainable widget modifications
- **Number Extensions**: Formatting and conversion utilities

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  extensions_core: ^0.0.2
```

## Usage

Import the package:

```dart
import 'package:extensions_core/extensions.dart';
```

### String Extensions

```dart
String text = "hello world";
String email = "user@example.com";
String url = "https://example.com";
String phone = "+1234567890";

// String validation
print(email.isEmail());          // true
print(url.isUrl());             // true
print(phone.isPhoneNumber());   // true
print("123".isNumeric());       // true
print("abc".isAlphabetic());    // true

// String manipulation
print(text.capitalize());       // "Hello world"
print(text.toTitleCase());      // "Hello World"
print(text.removeWhitespace()); // "helloworld"
print(text.reverse());          // "dlrow olleh"

// String utilities
print(text.truncate(5));        // "hello..."
print("".isNullOrWhiteSpace()); // true

// Password validation helpers
print("Password123".containsUppercase()); // true
print("Password123".containsLowercase()); // true
print("Password123".containsDigit());     // true
```

### List Extensions

```dart
List<int> numbers = [1, 2, 2, 3, 4, 5];
List<String?> items = ["a", null, "b", null, "c"];

// List operations
print(numbers.takeLast(2));      // [4, 5]
print(numbers.takeFirst(2));     // [1, 2]
print(numbers.distinct());       // [1, 2, 3, 4, 5]
print(numbers.reversedList());   // [5, 4, 3, 2, 2, 1]
print(items.whereNotNull());     // ["a", "b", "c"]

// List chunking
print(numbers.chunked(2));       // [[1, 2], [2, 3], [4, 5]]

// List utilities
print(numbers.shuffledList());   // [3, 1, 5, 2, 2, 4] (random order)
print(numbers.hasUniqueElements()); // false
print([].isNullOrEmpty());       // true

// Safe operations
print(numbers.safeGet(10));      // null (instead of throwing error)

// Transformation
List<String> transformed = numbers.mapToList((n) => "Num: $n");
print(transformed);              // ["Num: 1", "Num: 2", ...]
```

### DateTime Extensions

```dart
DateTime now = DateTime.now();
DateTime yesterday = now.subtract(Duration(days: 1));

// Date checks
print(now.isToday());           // true
print(yesterday.isYesterday()); // true
print(now.isInFuture());       // false
print(now.isInPast());         // false

// Formatting
print(now.format('yyyy-MM-dd')); // "2024-03-20"

// Relative time (requires BuildContext)
print(yesterday.timeAgo(context));  // "1 day ago"

// Locale-aware formatting (requires BuildContext)
print(now.formattedDate(context, pattern: 'MMM dd, yyyy')); // "Mar 20, 2024"
```

### BuildContext Extensions

```dart
// Snackbar Extensions
context.showSnackBar("Operation completed successfully!");
context.removeSnackBar();

// Alert Dialog Extensions
context.showCusDialog(
  AlertDialog(
    title: Text("Alert"),
    content: Text("This is a custom alert dialog"),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("OK"),
      ),
    ],
  ),
);
```

### Theme Extensions

Access theme data and custom theme extensions easily:

```dart
// Theme access (implementation details in theme.dart)
final primaryColor = context.theme.primaryColor;
final textTheme = context.theme.textTheme;
```

### Widget Extensions

Chain widget modifications easily:

```dart
Text('Hello')
  .padding()                 // Add default padding
  .center                    // Center the widget
  .expanded                  // Expand to fill space
  .onTap(() {})             // Add tap handler
  .opacity(0.8)             // Add opacity
  .circular(12)             // Add circular border
  .elevated();              // Add elevation

// Flexible sizing
Text('Hello').size(width: 100, height: 50);

// Custom alignment
Text('Hello').align(Alignment.centerLeft);

// Custom padding
Text('Hello').padding(EdgeInsets.all(8));
```

### Navigation Extensions

Simplified navigation methods:

```dart
// Basic navigation
context.pushScreen(HomeScreen());

// Replace current screen
context.replaceScreen(LoginScreen());

// Clear stack and show new screen
context.clearStackAndShow(DashboardScreen());

// Navigate with fade transition
context.pushWithFade(DetailsScreen());

// Pop until specific route
context.popUntilRoute('/home');
```

### Number Extensions

Format and convert numbers easily:

```dart
double price = 1234.5;
int count = 1200000;

// Currency formatting
print(price.toCurrency());           // "$1,234.50"
print(price.toCurrency(symbol: '€')); // "€1,234.50"

// Compact number format
print(count.toCompact());            // "1.2M"

// Percentage
print(75.toPercentage());           // "75%"

// Duration conversion
print(5.minutes);                   // Duration(minutes: 5)
print(24.hours);                    // Duration(hours: 24)

// Widget spacing
Container(
  child: Column(
    children: [
      Text('First'),
      10.heightBox,                // SizedBox for vertical spacing
      Text('Second'),
      20.widthBox,                 // SizedBox for horizontal spacing
    ],
  ),
);

// Number utilities
print(5.isBetween(1, 10));        // true
print(15.clamp(0, 10));           // 10
print(45.toRadians);              // Convert to radians
print(pi.toDegrees);              // Convert to degrees
```

## Requirements

- Dart SDK: ^3.6.0
- Flutter: >=1.17.0

## Additional Information

- [Homepage](https://github.com/LeanQChris/extensions.git)
- [Bug Reports and Feature Requests](https://github.com/LeanQChris/extensions/issues)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. When contributing:

1. Ensure your code follows the Dart style guide
2. Add tests for any new features
3. Update documentation accordingly
4. Create an issue first for any major changes

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
