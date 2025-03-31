# NiceSearchBar  

A customizable, animated search bar for Flutter applications.  

## Features  
- Animated search bar that expands and collapses  
- Customizable hint text  
- Optional additional function on toggle  

## Installation  

Add this to your `pubspec.yaml`:  

```yaml
dependencies:
    nice_searchbar:
        git:
            url: https://github.com/didierganthier/nice_searchbar.git
```

Then run:

```sh
flutter pub get
```

## Usage  

Import the package:

```dart
import 'package:nice_searchbar/nice_searchbar.dart';
```

Use it in your app:

```dart
NiceSearchBar(
    hint: "Search...",
    onChanged: (value) {
        print("Search input: $value");
    },
    additionalFunction: () {
        print("AppBar toggled!");
    },
);
```
