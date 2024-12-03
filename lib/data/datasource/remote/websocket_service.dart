import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String url;
  WebSocketChannel?
      _channel; // Changed to nullable to prevent late initialization error

  WebSocketService(this.url);

  bool get isConnected => _channel != null;

  // Connect to the WebSocket server
  Future<void> connect() async {
    if (_channel == null) {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      print(_channel);
    }
  }

  // Disconnect from the WebSocket server
  void disconnect() {
    if (_channel != null) {
      _channel!.sink.close();
      _channel = null; // Reset channel after disconnecting
    }
  }

  // Send a message to the WebSocket server
  void send(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    } else {
      print('WebSocket is not connected');
    }
  }

  // Listen for messages from the WebSocket server
  void onMessage(void Function(String) callback) {
    if (_channel != null) {
      _channel!.stream.listen((message) {
        callback(message);
      });
    } else {
      print('WebSocket is not connected');
    }
  }
}
