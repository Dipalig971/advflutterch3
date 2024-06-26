<h1 align="center"> Advance Flutter Chapter 3 💻</h1>

<h2 align="center">3.1 connectivity_plus package</h2>

Step 1.Add the connectivity_plus dependency to your pubspec.yaml file:

```yaml
dependencies:
  flutter:
    sdk: flutter
 connectivity_plus: ^6.0.3
```
Then run flutter pub get to install the dependency.

### usage

Step 2.Import the connectivity_plus package in your Dart file:
```
import 'package:connectivity_plus/connectivity_plus.dart';
```

Step 3.Here’s a simple example of how to use connectivity_plus to monitor network connectivity in a Flutter app.

```dart
import 'package:connectivity_plus/connectivity_plus.dart';

final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

// This condition is for demo purposes only to explain every connection type.
if (connectivityResult.contains(ConnectivityResult.mobile)) {
  print("Device is connected to WiFi.");
} else if (connectivityResult.contains(ConnectivityResult.wifi)) {
  print("Device is connected to cellular data.");
} else {
  print("No active network connection.");
}
```
<div align="center">
     <img src="https://github.com/Dipalig971/advflutterch3/assets/143181151/98951421-18cc-48c8-8538-3ae484835fc3" width=22% height=33%>
  <img src="https://github.com/Dipalig971/advflutterch3/assets/143181151/05508523-8ed2-4c5d-a101-7c63bd351110" width=22% height=33%>
  <video src = 'https://github.com/Dipalig971/advflutterch3/assets/143181151/d5b9c8a2-d915-421b-8f89-78e3b78da18f'>
 </div>



<h2 align="center">3.1 connectivity_plus package</h2>

Step 1.Add the connectivity_plus dependency to your pubspec.yaml file:

```yaml
dependencies:
  flutter:
    sdk: flutter
 flutter_inappwebview: ^6.0.0
```
Then run flutter pub get to install the dependency.

### usage

Step 2.Import the connectivity_plus package in your Dart file:
```
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
```

Step 3.Here’s a simple example of how to use connectivity_plus to monitor network connectivity in a Flutter app.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('In-App WebView Example'),
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse("https://www.example.com")),
        ),
      ),
    );
  }
}

```
<div align="center">
     <img src="https://github.com/Dipalig971/advflutterch3/assets/143181151/7e094015-c736-420a-8d99-3be211236843" width=22% height=33%>
  <img src="https://github.com/Dipalig971/advflutterch3/assets/143181151/68c05bc2-7d29-4b99-af0d-637243176ea9" width=22% height=33%>
  <video src = 'https://github.com/Dipalig971/advflutterch3/assets/143181151/8a46b30f-b3bc-4d14-bea0-1c5fe452f6ef'>
 </div>

