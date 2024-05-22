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


