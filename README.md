# NiceSearchBar  

A customizable, animated search bar for Flutter applications.  

## Features  
- Animated search bar that expands and collapses  
- Customizable hint text  
- Configurable auto-expand on initialization  
- Autofocus option when expanded  
- Customizable icons and colors  
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
        print("Search input: \$value");
    },
    autoExpand: false, // Controls whether it expands on startup
    autofocus: true, // Enables autofocus when expanded
    foldedIcon: Icons.search,
    unfoldedIcon: Icons.close,
    foldedIconColor: Colors.grey,
    unfoldedIconColor: Colors.red,
    additionalFunction: () {
        print("Search bar toggled!");
    },
);
```

### Parameters:

| Parameter           | Type           | Default       | Description |
|--------------------|--------------|--------------|-------------|
| `onChanged`        | `Function(String)` | **Required** | Callback when text changes |
| `hint`             | `String?`     | `'Search'`    | Placeholder text for input |
| `foldedWidth`      | `double`      | `56.0`        | Width when collapsed |
| `unfoldedWidth`    | `double`      | `400.0`       | Width when expanded |
| `foldedIcon`       | `IconData`    | `Icons.search` | Icon when collapsed |
| `unfoldedIcon`     | `IconData`    | `Icons.close`  | Icon when expanded |
| `foldedIconColor`  | `Color?`      | `Colors.black` | Color of collapsed icon |
| `unfoldedIconColor` | `Color?`     | `Colors.black` | Color of expanded icon |
| `autoExpand`       | `bool`        | `true`        | Automatically expand on load |
| `autofocus`        | `bool`        | `false`       | Autofocus when expanded |
| `additionalFunction` | `VoidCallback?` | `null` | Optional function triggered on toggle |

**Note:** This widget will not work inside an `AppBar` unless properly configured. Ensure you handle layout constraints and widget placement correctly when integrating it into an `AppBar`.

---

### License
This package is open-source and available under the MIT License.

