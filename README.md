[![dashstack_poster](https://github.com/user-attachments/assets/4711330c-d9f5-42f2-ba92-59bdecb384a5)](https://www.dashstack.tech/)

# flutter_autosize_screen_pro

A lightweight and **flutter_autosize_screen_pro** that automatically adjusts widget sizes and text scaling according to the device screen. Achieve pixel-perfect UI across multiple screen sizes and resolutions without manually calculating sizes.  

Perfect for developers who want **consistent UI** across devices, **responsive layouts**, and **automatic text scaling**.

---
## Features

- 💡 Automatically adapts your app to any screen size.  
- 📏 Maintain a design reference width (e.g., 360px) and scale all widgets accordingly.  
- ✍️ Auto-adjust text size to keep your design consistent.  
- 🖥 Works for **portrait and landscape orientations**.  
- 🔄 Simple integration with `MaterialApp` via the `builder` property.  
- 🎨 Works with `MediaQuery` and preserves padding, viewInsets, and viewPadding.

---
## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_autosize_screen_pro: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:flutter_autosize_screen_pro/flutter_autosize_screen_pro.dart';
```

### 4. Use it

1. Initialize the package

 * Set your design standard width and enable/disable automatic text scaling:

```
import 'package:flutter_autosize_screen_pro/auto_size_util.dart';

void main() {
  AutoSizeUtil.setStandard(360, isAutoTextSize: true);
  runApp(const MyApp());
}
```

2. Use appBuilder in MaterialApp

```
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoSize Screen Pro Demo',
      builder: AutoSizeUtil.appBuilder, // <-- integrate package here
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

```

3. Get Adapted Screen Size

```
Size screenSize = AutoSizeUtil.getScreenSize();
print("Adapted screen size: $screenSize");
```

4. Example HomePage with Adaptive Widgets
```
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AutoSize Screen Pro")),
      body: Column(
        children: [
          Container(
            width: 360, // design width
            height: 60,
            color: Colors.purple,
            child: const Center(child: Text("Width is 360")),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.red,
                  child: const Center(child: Text("Half screen")),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.blue,
                  child: const Center(child: Text("Half screen")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

```
## 📸 Example
|Mobile Screen| Web Screen |
|-------------------|-----------------------------|
| ![without formatterPattern](https://github.com/user-attachments/assets/07b7d0ea-048d-466d-b8b6-c774d249735e) | ![formatterPattern](https://github.com/user-attachments/assets/81e5da74-861f-4699-a296-41d8fd1113d2)  |


## How It Works

* Design Standard: You define a reference screen width (e.g., 360px) with AutoSizeUtil.setStandard().

* Device Adaptation: The package calculates the device pixel ratio and scales widgets accordingly.

* Text Scaling: Optional auto text scaling ensures fonts look consistent on all devices.

* Orientation Awareness: Works for both portrait and landscape modes.

# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](https://github.com/Androidsignal/flutter_autosize_screen_pro/issues).

# Acknowledgments 
flutter_autosize_screen_pro builds on top of Flutter’s foundation to provide a ready-to-use, customizable screen adaptation and scaling solution. While Flutter’s MediaQuery and the intl package provide the core tools, this package simplifies the process by combining scaling logic, text adaptation, and widget resizing into a single, drop-in solution for any Flutter app.

We’d like to acknowledge the Flutter and Dart teams for their robust frameworks, which make creating adaptive and responsive apps effortless.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`flutter_autosize_screen_pro` is owned and maintained by the `Dashstack Infotech team (SURAT, INDIA)`.
Follow us for updates and new releases 🚀.
